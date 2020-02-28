Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D461D17383D
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Feb 2020 14:25:09 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C769C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Feb 2020 13:25:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DA83C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Feb 2020 13:25:08 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01SDHAte001024; Fri, 28 Feb 2020 14:25:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=QKsGwaTq+v5uudPFGab/1QI9kJrNFmevW7JelcKghxA=;
 b=vC+P2SLvdBZW/AQKk8fs0Jz9BEWegxKTvMp3KrvZ3TgAxUISTZAPWsU+ZJGjQmDNogO2
 GYmpvR95tojqtmiKG5wOgOZPJK3ti+BgCUE4e+Nej4e2qgZU6/3zQI3h+P91T5WBiwHJ
 VmM5yy+LoREAT4Er+nH3Jlvki1En5n6J39ihonU0En0nefW0c5Gvkg9/ejy9ryHzuoF8
 7qU9CzuqQfMiwYOxDVwpXpCXaKDhD81jORa8A4rVOzsFQhe53ZoUEbfsoLqcrwKDh4XP
 o/wbp+BGogBWHPrY1+PDoJivabbNOTUXUE+X/p9z7xBQtzyNZ3UySlKIP8i6+xhYANmn /w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yepvvc3fk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Feb 2020 14:25:03 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8A3AB10002A;
 Fri, 28 Feb 2020 14:24:58 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7A6172BC7D1;
 Fri, 28 Feb 2020 14:24:58 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 28 Feb
 2020 14:24:57 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 28 Feb 2020 14:24:57 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>, Tom Rini <trini@konsulko.com>
Thread-Topic: [PATCH 1/1] scripts: add documentation-file-ref-check
Thread-Index: AQHV7BUKvXBf5+2gBk+ru8xkVhMR36gwVAKw
Date: Fri, 28 Feb 2020 13:24:57 +0000
Message-ID: <82390057a4904c94bbf000fb98274d3d@SFHDAG6NODE3.st.com>
References: <20200225195142.5682-1-xypron.glpk@gmx.de>
In-Reply-To: <20200225195142.5682-1-xypron.glpk@gmx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-28_04:2020-02-26,
 2020-02-28 signatures=0
Cc: Breno Matheus Lima <breno.lima@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/1] scripts: add
	documentation-file-ref-check
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Heinrich,

> From: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Sent: mardi 25 f=E9vrier 2020 20:52
> =

> 'make refcheckdocs' requires scripts/documentation-file-ref-check.
> Adopt script from Linux v5.6-rc3.
> =

> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---

Reviewed-by: Patrick Delaunay <Patrick.delaunay@st.com>

It is just a copy of kernel script with =

+ "/Documentation" =3D>  "/doc"
+ remove kernel specific rules

Just 2 remarks on ftp and binding directory (for --fix option)

>  scripts/documentation-file-ref-check | 226 +++++++++++++++++++++++++++
>  1 file changed, 226 insertions(+)
>  create mode 100755 scripts/documentation-file-ref-check
> =

> diff --git a/scripts/documentation-file-ref-check b/scripts/documentation=
-file-ref-
> check
> new file mode 100755
> index 0000000000..9978fc9a91
> --- /dev/null
> +++ b/scripts/documentation-file-ref-check
> @@ -0,0 +1,226 @@
> +#!/usr/bin/env perl
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Treewide grep for references to files under doc, and report #
> +non-existing files in stderr.
> +
> +use warnings;
> +use strict;
> +use Getopt::Long qw(:config no_auto_abbrev);
> +
> +# NOTE: only add things here when the file was gone, but the text wants
> +# to mention a past documentation file, for example, to give credits
> +for # the original work.
> +my %false_positives =3D (
> +);
> +
> +my $scriptname =3D $0;
> +$scriptname =3D~ s,.*/([^/]+/),$1,;
> +
> +# Parse arguments
> +my $help =3D 0;
> +my $fix =3D 0;
> +my $warn =3D 0;
> +
> +if (! -d ".git") {
> +	printf "Warning: can't check if file exists, as this is not a git tree";
> +	exit 0;
> +}
> +
> +GetOptions(
> +	'fix' =3D> \$fix,
> +	'warn' =3D> \$warn,
> +	'h|help|usage' =3D> \$help,
> +);
> +
> +if ($help !=3D 0) {
> +    print "$scriptname [--help] [--fix]\n";
> +    exit -1;
> +}
> +
> +# Step 1: find broken references
> +print "Finding broken references. This may take a while...  " if
> +($fix);
> +
> +my %broken_ref;
> +
> +my $doc_fix =3D 0;
> +
> +open IN, "git grep ':doc:\`' doc/|"
> +     or die "Failed to run git grep";
> +while (<IN>) {
> +	next if (!m,^([^:]+):.*\:doc\:\`([^\`]+)\`,);
> +
> +	my $d =3D $1;
> +	my $doc_ref =3D $2;
> +
> +	my $f =3D $doc_ref;
> +
> +	$d =3D~ s,(.*/).*,$1,;
> +	$f =3D~ s,.*\<([^\>]+)\>,$1,;
> +
> +	$f =3D"$d$f.rst";
> +
> +	next if (grep -e, glob("$f"));
> +
> +	if ($fix && !$doc_fix) {
> +		print STDERR "\nWARNING: Currently, can't fix broken :doc:``
> fields\n";
> +	}
> +	$doc_fix++;
> +
> +	print STDERR "$f: :doc:`$doc_ref`\n";
> +}
> +close IN;
> +
> +open IN, "git grep 'doc/'|"
> +     or die "Failed to run git grep";
> +while (<IN>) {
> +	next if (!m/^([^:]+):(.*)/);
> +
> +	my $f =3D $1;
> +	my $ln =3D $2;
> +
> +	# On linux-next, discard the Next/ directory
> +	next if ($f =3D~ m,^Next/,);
> +
> +	# Makefiles and scripts contain nasty expressions to parse docs
> +	next if ($f =3D~ m/Makefile/ || $f =3D~ m/\.sh$/);
> +
> +	# Skip this script
> +	next if ($f eq $scriptname);
> +
> +	# Ignore the dir where documentation will be built
> +	next if ($ln =3D~ m,\b(\S*)doc/output,);
> +
> +	if ($ln =3D~ m,\b(\S*)(doc/[A-Za-z0-9\_\.\,\~/\*\[\]\?+-]*)(.*),) {
> +		my $prefix =3D $1;
> +		my $ref =3D $2;
> +		my $base =3D $2;
> +		my $extra =3D $3;
> +
> +		# some file references are like:
> +		# /usr/src/linux/doc/DMA-{API,mapping}.txt
> +		# For now, ignore them
> +		next if ($extra =3D~ m/^{/);
> +
> +		# Remove footnotes at the end like:
> +		# doc/devicetree/dt-object-internal.txt[1]
> +		$ref =3D~ s/(txt|rst)\[\d+]$/$1/;
> +
> +		# Remove ending ']' without any '['
> +		$ref =3D~ s/\].*// if (!($ref =3D~ m/\[/));
> +
> +		# Remove puntuation marks at the end
> +		$ref =3D~ s/[\,\.]+$//;
> +
> +		my $fulref =3D "$prefix$ref";
> +
> +		$fulref =3D~ s/^(\<file|ref)://;
> +		$fulref =3D~ s/^[\'\`]+//;
> +		$fulref =3D~ s,^\$\(.*\)/,,;
> +		$base =3D~ s,.*/,,;
> +
> +		# Remove URL false-positives
> +		next if ($fulref =3D~ m/^http/);

		next if ($fulref =3D~ m/^ftp/);

To avoid issue on ftp URL =3D =


include/ata.h: ftp://ftp.fee.vutbr.cz/pub/doc/io/ata/ata-3/ata3r5v.zip
lib/zlib/trees.c: ftp.uu.net:/pub/archiving/zip/doc/deflate-1.1.do

> +		# Check if exists, evaluating wildcards
> +		next if (grep -e, glob("$ref $fulref"));
> +
> +		# Accept relative doc patches for tools/
> +		if ($f =3D~ m/tools/) {
> +			my $path =3D $f;
> +			$path =3D~ s,(.*)/.*,$1,;
> +			next if (grep -e, glob("$path/$ref $path/../$ref
> $path/$fulref"));
> +		}
> +
> +		# Discard known false-positives
> +		if (defined($false_positives{$f})) {
> +			next if ($false_positives{$f} eq $fulref);
> +		}
> +
> +		if ($fix) {
> +			if (!($ref =3D~ m/(scripts|Kconfig|Kbuild)/)) {
> +				$broken_ref{$ref}++;
> +			}
> +		} elsif ($warn) {
> +			print STDERR "Warning: $f references a file that doesn't
> exist: $fulref\n";
> +		} else {
> +			print STDERR "$f: $fulref\n";
> +		}
> +	}
> +}
> +close IN;
> +
> +exit 0 if (!$fix);
> +
> +# Step 2: Seek for file name alternatives print "Auto-fixing broken
> +references. Please double-check the results\n";
> +
> +foreach my $ref (keys %broken_ref) {
> +	my $new =3D$ref;
> +
> +	my $basedir =3D ".";
> +	# On translations, only seek inside the translations directory
> +	$basedir  =3D $1 if ($ref =3D~ m,(doc/translations/[^/]+),);
> +
> +	# get just the basename
> +	$new =3D~ s,.*/,,;
> +
> +	my $f=3D"";
> +
> +	# usual reason for breakage: DT file moved around
> +	if ($ref =3D~ /devicetree/) {
> +		# usual reason for breakage: DT file renamed to .yaml
> +		if (!$f) {
> +			my $new_ref =3D $ref;
> +			$new_ref =3D~ s/\.txt$/.yaml/;
> +			$f=3D$new_ref if (-f $new_ref);
> +		}
> +
> +		if (!$f) {
> +			my $search =3D $new;
> +			$search =3D~ s,^.*/,,;
> +			$f =3D qx(find doc/devicetree/ -iname "*$search*") if
> ($search);

No "devicetree/ bindings/" directory in U-boot
=3D> I think "doc/device-tree-bindings/" should be used here =


+			$f =3D qx(find doc/device-tree-bindings/ -iname "*$search*") if ($searc=
h);

> +			if (!$f) {
> +				# Manufacturer name may have changed
> +				$search =3D~ s/^.*,//;
> +				$f =3D qx(find doc/devicetree/ -iname "*$search*") if
> ($search);

+			$f =3D qx(find doc/device-tree-bindings/ -iname "*$search*") if  ($sear=
ch);

> +			}
> +		}
> +	}
> +
> +	# usual reason for breakage: file renamed to .rst
> +	if (!$f) {
> +		$new =3D~ s/\.txt$/.rst/;
> +		$f=3Dqx(find $basedir -iname $new) if ($new);
> +	}
> +
> +	# usual reason for breakage: use dash or underline
> +	if (!$f) {
> +		$new =3D~ s/[-_]/[-_]/g;
> +		$f=3Dqx(find $basedir -iname $new) if ($new);
> +	}
> +
> +	# Wild guess: seek for the same name on another place
> +	if (!$f) {
> +		$f =3D qx(find $basedir -iname $new) if ($new);
> +	}
> +
> +	my @find =3D split /\s+/, $f;
> +
> +	if (!$f) {
> +		print STDERR "ERROR: Didn't find a replacement for $ref\n";
> +	} elsif (scalar(@find) > 1) {
> +		print STDERR "WARNING: Won't auto-replace, as found multiple
> files close to $ref:\n";
> +		foreach my $j (@find) {
> +			$j =3D~ s,^./,,;
> +			print STDERR "    $j\n";
> +		}
> +	} else {
> +		$f =3D $find[0];
> +		$f =3D~ s,^./,,;
> +		print "INFO: Replacing $ref to $f\n";
> +		foreach my $j (qx(git grep -l $ref)) {
> +			qx(sed "s\@$ref\@$f\@g" -i $j);
> +		}
> +	}
> +}
> --
> 2.25.0

Regard,

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
