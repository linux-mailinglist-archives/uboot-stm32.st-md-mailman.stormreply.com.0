Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 578CF16EF68
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Feb 2020 20:52:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15051C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Feb 2020 19:52:02 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4AF1FC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2020 19:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1582660314;
 bh=WAkKnglvs6wtFEiugeGlAkmTNjEKNne26+BP1dVtFow=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=GnfywL86baUpi3woi7nnaEf2/NhMDpC5X6d4sCPHvQ57ucyiEFTI5QDjZKhcav3Oy
 0wviooGqmTxz+GESlnNGjr4qkqMtlVSvaY5X8wLhzDcHwVkmMz7XoXkmAsZ7C4JF0M
 HmnEkIe9ftz8Z6C/IhpuPWzD14KNpd5RqLu93628=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from LT02.fritz.box ([84.119.33.160]) by mail.gmx.com (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1Mq2nK-1jkuYC0MYU-00n8ov; Tue, 25
 Feb 2020 20:51:54 +0100
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
To: Tom Rini <trini@konsulko.com>
Date: Tue, 25 Feb 2020 20:51:42 +0100
Message-Id: <20200225195142.5682-1-xypron.glpk@gmx.de>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:xf2ehthZnHdMWfVCMc4aEr4wlgs80CADlo+gzE9yn9XQ2FmCSJX
 E0F+/PJg6iaIAKTeqWDT6suzCCsZqtUKHjtUQC8Mz6jK87U3vkeMtJ7/X0xj2Cru/1uuOGS
 gNKhWwqEBTBX+NU4uCw1WCCJ6yn6a8Fs1ByIl6lIEQ0Y8nhopvxTZ9YLCGZI9DVMkNckMnn
 IzcNgADDaX3Ggme96YySw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/IsrwYH5qkE=:bOqLrttofGXecVfCMXeegT
 wfpqEdVt6CYMHt8OEhCBaDnYHHjqEgb2LzvbjnPwVqJYi4wkIgXN4O35x3VSmay8ZxfXykVME
 k+2VwZB3QwMp8x9O6xu/tMI0APmqLY/r4BF1kCZ3B30n8bg2h7nWxxTOe4xqfQUyZEZI0PPCY
 hgs0KSP+GDuw0xDtUwv9HsNKDObIR128th6Jd8r4bbqIn8Qp0L23+qiPYnKe9jBCIVXYxTpZT
 UnNl6RSuAKB/1vghSW2ZGsw2N2nZpZX6Yldo/yR2IY56Ts1H28eLJ88wrEFo2QeIJ+suq4Bu/
 UFOFqqArj/G/jB0W+kgJdSSRqA4T11NGoHR+mNhSy78lDWCQef7A6WJZZbk3eQETGqhwaj3dW
 mLxlspbNOZPNEDQ+FSfbUsODJAURuuLDWOhBNwTSMlqA4It18i5boFpe8JvX6xvitTg8WAfj3
 mD59HTyMGqZbe/lgTV2lRIc6k1ZnzJfc62v2PnmhAqecS1AqAuO4crK28iAdtaSv3b0fPcHz/
 YcQww1HWE3qvNm2sZfrbH4vlLKt/Drdcqzgs4LVb059474NS0v8Xt092H28tXPoIJHFtiw3Vc
 UfWulFDy4lFDzYe9pUD2FggFn63rUKglwxM7vXemnTstYjaDy1j/Tbxbdur7l9DrORsIWKqsv
 qSERvASAux4i0vMqV4jswSlkDRc+fti3gTKMHmeALhJPdPDvH2IsqIeL2DK48dllFzNlq7Kbi
 I8oT6x6+m9C8WdHXkaET4uidC1GhD64IRXPyczCYGV3hF7Etra6O0l6nf8k3Dcs0SHV19H4Wy
 +roN44GqJsez78kRE3SjsvYOTZ10dBtqW7sKbeTlCzRRixro7cgCwS59iLXCijVrPc4HUP3c8
 vh4Z6dNrRVJoJ6legR4bmZaisrDqLOny09yh2BbVp24rf3pBk8BFC1mQ4gVu0fcDIuGgmQDR+
 89VHRox/SuDHfsiDGv+zEbLmqI4eJMn3lHN5iQ1gs1Jmb85gNsfR2UIDJZ9GBWjsJQ1EN68Pv
 /q9L5pimzf8HyAheLU6FcP/CFMmuHvGIqsZwaxb65yHsHVga/BKS85Cv32TlztbpcOg71FnDh
 KrOXlG8cu4exLR9PvrFS33vwtbBYnglwJc0WRWSIjdthPA1G4lo1GAdzlzWS3MYcXwDssN6L/
 DlARewPhK+3Y9GxcOteIggvtXg/lBxolihdq4FpxH1TwX5Uo44cPJTcbv85oF8HhsZNm3BAHe
 7EBULxo0DtUlH4Udg
Cc: Breno Matheus Lima <breno.lima@nxp.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH 1/1] scripts: add documentation-file-ref-check
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

'make refcheckdocs' requires scripts/documentation-file-ref-check.
Adopt script from Linux v5.6-rc3.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
 scripts/documentation-file-ref-check | 226 +++++++++++++++++++++++++++
 1 file changed, 226 insertions(+)
 create mode 100755 scripts/documentation-file-ref-check

diff --git a/scripts/documentation-file-ref-check b/scripts/documentation-file-ref-check
new file mode 100755
index 0000000000..9978fc9a91
--- /dev/null
+++ b/scripts/documentation-file-ref-check
@@ -0,0 +1,226 @@
+#!/usr/bin/env perl
+# SPDX-License-Identifier: GPL-2.0
+#
+# Treewide grep for references to files under doc, and report
+# non-existing files in stderr.
+
+use warnings;
+use strict;
+use Getopt::Long qw(:config no_auto_abbrev);
+
+# NOTE: only add things here when the file was gone, but the text wants
+# to mention a past documentation file, for example, to give credits for
+# the original work.
+my %false_positives = (
+);
+
+my $scriptname = $0;
+$scriptname =~ s,.*/([^/]+/),$1,;
+
+# Parse arguments
+my $help = 0;
+my $fix = 0;
+my $warn = 0;
+
+if (! -d ".git") {
+	printf "Warning: can't check if file exists, as this is not a git tree";
+	exit 0;
+}
+
+GetOptions(
+	'fix' => \$fix,
+	'warn' => \$warn,
+	'h|help|usage' => \$help,
+);
+
+if ($help != 0) {
+    print "$scriptname [--help] [--fix]\n";
+    exit -1;
+}
+
+# Step 1: find broken references
+print "Finding broken references. This may take a while...  " if ($fix);
+
+my %broken_ref;
+
+my $doc_fix = 0;
+
+open IN, "git grep ':doc:\`' doc/|"
+     or die "Failed to run git grep";
+while (<IN>) {
+	next if (!m,^([^:]+):.*\:doc\:\`([^\`]+)\`,);
+
+	my $d = $1;
+	my $doc_ref = $2;
+
+	my $f = $doc_ref;
+
+	$d =~ s,(.*/).*,$1,;
+	$f =~ s,.*\<([^\>]+)\>,$1,;
+
+	$f ="$d$f.rst";
+
+	next if (grep -e, glob("$f"));
+
+	if ($fix && !$doc_fix) {
+		print STDERR "\nWARNING: Currently, can't fix broken :doc:`` fields\n";
+	}
+	$doc_fix++;
+
+	print STDERR "$f: :doc:`$doc_ref`\n";
+}
+close IN;
+
+open IN, "git grep 'doc/'|"
+     or die "Failed to run git grep";
+while (<IN>) {
+	next if (!m/^([^:]+):(.*)/);
+
+	my $f = $1;
+	my $ln = $2;
+
+	# On linux-next, discard the Next/ directory
+	next if ($f =~ m,^Next/,);
+
+	# Makefiles and scripts contain nasty expressions to parse docs
+	next if ($f =~ m/Makefile/ || $f =~ m/\.sh$/);
+
+	# Skip this script
+	next if ($f eq $scriptname);
+
+	# Ignore the dir where documentation will be built
+	next if ($ln =~ m,\b(\S*)doc/output,);
+
+	if ($ln =~ m,\b(\S*)(doc/[A-Za-z0-9\_\.\,\~/\*\[\]\?+-]*)(.*),) {
+		my $prefix = $1;
+		my $ref = $2;
+		my $base = $2;
+		my $extra = $3;
+
+		# some file references are like:
+		# /usr/src/linux/doc/DMA-{API,mapping}.txt
+		# For now, ignore them
+		next if ($extra =~ m/^{/);
+
+		# Remove footnotes at the end like:
+		# doc/devicetree/dt-object-internal.txt[1]
+		$ref =~ s/(txt|rst)\[\d+]$/$1/;
+
+		# Remove ending ']' without any '['
+		$ref =~ s/\].*// if (!($ref =~ m/\[/));
+
+		# Remove puntuation marks at the end
+		$ref =~ s/[\,\.]+$//;
+
+		my $fulref = "$prefix$ref";
+
+		$fulref =~ s/^(\<file|ref)://;
+		$fulref =~ s/^[\'\`]+//;
+		$fulref =~ s,^\$\(.*\)/,,;
+		$base =~ s,.*/,,;
+
+		# Remove URL false-positives
+		next if ($fulref =~ m/^http/);
+
+		# Check if exists, evaluating wildcards
+		next if (grep -e, glob("$ref $fulref"));
+
+		# Accept relative doc patches for tools/
+		if ($f =~ m/tools/) {
+			my $path = $f;
+			$path =~ s,(.*)/.*,$1,;
+			next if (grep -e, glob("$path/$ref $path/../$ref $path/$fulref"));
+		}
+
+		# Discard known false-positives
+		if (defined($false_positives{$f})) {
+			next if ($false_positives{$f} eq $fulref);
+		}
+
+		if ($fix) {
+			if (!($ref =~ m/(scripts|Kconfig|Kbuild)/)) {
+				$broken_ref{$ref}++;
+			}
+		} elsif ($warn) {
+			print STDERR "Warning: $f references a file that doesn't exist: $fulref\n";
+		} else {
+			print STDERR "$f: $fulref\n";
+		}
+	}
+}
+close IN;
+
+exit 0 if (!$fix);
+
+# Step 2: Seek for file name alternatives
+print "Auto-fixing broken references. Please double-check the results\n";
+
+foreach my $ref (keys %broken_ref) {
+	my $new =$ref;
+
+	my $basedir = ".";
+	# On translations, only seek inside the translations directory
+	$basedir  = $1 if ($ref =~ m,(doc/translations/[^/]+),);
+
+	# get just the basename
+	$new =~ s,.*/,,;
+
+	my $f="";
+
+	# usual reason for breakage: DT file moved around
+	if ($ref =~ /devicetree/) {
+		# usual reason for breakage: DT file renamed to .yaml
+		if (!$f) {
+			my $new_ref = $ref;
+			$new_ref =~ s/\.txt$/.yaml/;
+			$f=$new_ref if (-f $new_ref);
+		}
+
+		if (!$f) {
+			my $search = $new;
+			$search =~ s,^.*/,,;
+			$f = qx(find doc/devicetree/ -iname "*$search*") if ($search);
+			if (!$f) {
+				# Manufacturer name may have changed
+				$search =~ s/^.*,//;
+				$f = qx(find doc/devicetree/ -iname "*$search*") if ($search);
+			}
+		}
+	}
+
+	# usual reason for breakage: file renamed to .rst
+	if (!$f) {
+		$new =~ s/\.txt$/.rst/;
+		$f=qx(find $basedir -iname $new) if ($new);
+	}
+
+	# usual reason for breakage: use dash or underline
+	if (!$f) {
+		$new =~ s/[-_]/[-_]/g;
+		$f=qx(find $basedir -iname $new) if ($new);
+	}
+
+	# Wild guess: seek for the same name on another place
+	if (!$f) {
+		$f = qx(find $basedir -iname $new) if ($new);
+	}
+
+	my @find = split /\s+/, $f;
+
+	if (!$f) {
+		print STDERR "ERROR: Didn't find a replacement for $ref\n";
+	} elsif (scalar(@find) > 1) {
+		print STDERR "WARNING: Won't auto-replace, as found multiple files close to $ref:\n";
+		foreach my $j (@find) {
+			$j =~ s,^./,,;
+			print STDERR "    $j\n";
+		}
+	} else {
+		$f = $find[0];
+		$f =~ s,^./,,;
+		print "INFO: Replacing $ref to $f\n";
+		foreach my $j (qx(git grep -l $ref)) {
+			qx(sed "s\@$ref\@$f\@g" -i $j);
+		}
+	}
+}
--
2.25.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
