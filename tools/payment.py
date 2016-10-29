#!/usr/bin/python
import time, sys, re, getopt

def calc(file):
	with open(file, 'r') as f:
		p = re.compile('\d+')
		for line in f:
			if 'mon:' in line:
				work_time = earn = .0
				train = 0
				mon= day= start_h= start_m= end_h= end_m = ""
				train_cost = 500 * 2
				cost = 1100 / 60.

				d = re.split('\W+', line)
				print 'Mon: {}'.format(d[1])
				if 'pay' in d:
					cost = float(d[d.index('pay') + 1]) / 60.
					print 'Cost: {} en.'.format(cost * 60)
				if 'trans' in d:
					train_cost = float(d[d.index('trans') + 1]) * 2
					print 'trans: {}'.format(train_cost)

			if p.match(line):
				mon, day, start_h, start_m, end_h, end_m = p.findall(line)
				tmp = (float(end_h) - float(start_h)) * 60 + (float(end_m) - float(start_m))

				work_time += tmp
				earn += tmp * cost
				train += 1

				print '{}/{} work from {}:{} to {}:{} is {} min and earn {:,.2f} en.'.format(mon, day, end_h, end_m, start_h, start_m, tmp, tmp * cost)

			if 'pre:' in line:
				pre = int(line.split(':')[1])
				earn -= pre
				print 'Advance: {:,.2f} and remain: {:,.2f}'.format(pre, earn)
			if 'fin' in line:
				print 'At mon: {}, work {} days'.format(mon,train)
				print 'work: {}:{} -- payment:{:,.2f} + transfer: {:,} = earn: {:,.2f}.\n\n'.format(int(work_time/60), int(work_time%60),earn, train*train_cost, earn + train * train_cost)	


def main():
	try:
		opts, args = getopt.getopt(sys.argv[1:], "hr:t")
	except getopt.GetoptError:
		print 'payment.py -h'
		sys.exit(0)

	for opt, arg in opts:
		if opt == '-h':
			print 'payment.py -r <file>\tRun calc'
			print 'payment.py -t\tTemplate of file'
		elif opt == '-r':
			calc(arg)
		elif opt == '-t':
			print 'Template:'
			print '\tmon: <Month>, cost: <Cost=1000>, trans: <trans=500/one_way>'
			print '\t<mon>/<day> <start_hour>:<start_min> - <end_hour>:<end_min>'
			print '\tpre: <price>'
			print '\tfin'
			print
			print 'Time is 24h format.'

	if not opts:
		print 'payment.py -h'
		sys.exit(0)


			

if __name__ == '__main__':
	main()