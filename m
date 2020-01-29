Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EA914D008
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Jan 2020 19:01:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98A06C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Jan 2020 18:01:41 +0000 (UTC)
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
 [209.85.219.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70371C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2020 18:01:39 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id f136so263946ybg.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2020 10:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/KjeDcJRQo1tLWmji0a6/C1ppN7roIPS1L37oo2ev0s=;
 b=nysEXvNb6v61dX0yDxU2OYevNRCjjf3hhEY3dvdPoSSo2aqDsM4TIrLIlEYovcaim3
 C0frs+214ZcIf6eMt9y0AdnEoox0SsRimaDTfqsKcvXPdzkoSWb0Ad04DhkXzamM/5Jc
 dmQHpi/CV6Be22renvpWulD13l2R1XSiMHZIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/KjeDcJRQo1tLWmji0a6/C1ppN7roIPS1L37oo2ev0s=;
 b=bP/eMUW9CGWa0CYrXHsT+z57aHUn1mTQ70YqpQqhi+HnN7hthI16J6l2RownhKHd4t
 PtROS+NF8MzsllAX+qUaeKx1w4zpfZxMIjYTWys9hTBmKCk5S39Ip0v6oZikne6nMJK9
 4M69yeb5O1P0rfyD6JLhxwXWLXU5xUTcvIXx8XHQ50fnBnzlyLANYV4bxyuUSIp032xT
 DtL0B2S5I2V2viRYdWpiEKrNGyZnRdPADw11fS7/brkSaAucN5cXL3kfKPm+zrFVkj/4
 qO0bOQB8OA/t99+m9or/IanqoCEfjoEHhNTGXhyFKdjNQJKsPrdXFOAxEpPMqkqEnjj9
 OR/A==
X-Gm-Message-State: APjAAAVv0d6wbSKJRSt98C+3NGqV3Yq0qcgfpMWgqD1TNLcwbVS0WlAL
 cqjUtuMauvz9yw1gMRBMSmMf1A==
X-Google-Smtp-Source: APXvYqz9+OvmjH8eImj64O1FWjWNpIRN5W+7FoG02vMbSiuicaWQB9nNTIpM0MHj++SDHNGKJv/jGA==
X-Received: by 2002:a25:cc83:: with SMTP id l125mr568920ybf.107.1580320897772; 
 Wed, 29 Jan 2020 10:01:37 -0800 (PST)
Received: from bill-the-cat
 (2606-a000-1401-86dd-cca4-0bb0-81e0-6190.inf6.spectrum.com.
 [2606:a000:1401:86dd:cca4:bb0:81e0:6190])
 by smtp.gmail.com with ESMTPSA id i72sm1255731ywg.49.2020.01.29.10.01.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Jan 2020 10:01:36 -0800 (PST)
Date: Wed, 29 Jan 2020 13:01:32 -0500
From: Tom Rini <trini@konsulko.com>
To: u-boot@lists.denx.de
Message-ID: <20200129180132.GQ13379@bill-the-cat>
References: <20200128154829.GS13379@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20200128154829.GS13379@bill-the-cat>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Baruch Siach <baruch@tkos.co.il>,
 Eddy =?utf-8?B?UGV0cmnImW9y?= <eddy.petrisor@gmail.com>,
 Nikita Kiryanov <nikita@compulab.co.il>,
 Patrick Bruenn <p.bruenn@beckhoff.com>, Adrian Alonso <adrian.alonso@nxp.com>,
 Bhaskar Upadhaya <bhaskar.upadhaya@nxp.com>,
 Ken Lin <Ken.Lin@advantech.com.tw>, Vanessa Maegima <vanessa.maegima@nxp.com>,
 David Feng <fenghua@phytium.com.cn>, Atish Patra <atish.patra@wdc.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>,
 Richard Hu <richard.hu@technexion.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Marek Vasut <marex@denx.de>,
 Sudhanshu Gupta <sudhanshu.gupta@nxp.com>,
 Parthiban Nallathambi <parthitce@gmail.com>, Ian Ray <ian.ray@ge.com>,
 Sumit Garg <sumit.garg@nxp.com>, Vinitha V Pillai <vinitha.pillai@nxp.com>,
 Uri Mashiach <uri.mashiach@compulab.co.il>,
 Simone CIANNI <simone.cianni@bticino.it>, Jason Liu <jason.hui.liu@nxp.com>,
 Gilles Gameiro <gilles@gigadevices.com>, Feng Li <feng.li_2@nxp.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 Andreas Geisreiter <ageisreiter@dh-electronics.de>,
 Otavio Salvador <otavio@ossystems.com.br>, Breno Lima <breno.lima@nxp.com>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 Alison Wang <alison.wang@nxp.com>, Udit Agarwal <udit.agarwal@nxp.com>,
 Yunfeng Ding <yunfeng.ding@nxp.com>,
 Raffaele RECALCATI <raffaele.recalcati@bticino.it>,
 Akshay Bhat <akshaybhat@timesys.com>, Ludwig Zenz <lzenz@dh-electronics.de>,
 Markus Niebel <Markus.Niebel@tq-group.com>,
 Igor Opaniuk <igor.opaniuk@toradex.com>, Tang Yuantian <andy.tang@nxp.com>,
 Antti =?iso-8859-1?Q?M=E4entausta?= <antti.maentausta@ge.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 Francesco Montefoschi <francesco.montefoschi@udoo.org>,
 Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Subject: Re: [Uboot-stm32] Removing "fdt_high=0xffffffff" from board
	environments
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
Content-Type: multipart/mixed; boundary="===============7365632926032044741=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7365632926032044741==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cW27jhpBl+zg4ncD"
Content-Disposition: inline


--cW27jhpBl+zg4ncD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2020 at 10:48:29AM -0500, Tom Rini wrote:

> Hey all,
>=20
> Relatively recently it's been highlighted that a number of boards are
> disabling relocation of the device tree image in memory and this in turn
> leading to various difficult to resolve bugs.  At heart, disabling
> device tree relocation at boot is something that should be used in rare
> circumstances (and more generally fdt_high / initrd_high set to where
> they are already residing in memory, as a known, correct and aligned
> address).
>=20
> I would like to ask everyone to update their board config file to use
> the bootm_size (or set CONFIG_SYS_BOOTMAPSZ) to the amount of memory
> (size, not location) available to safely contain a kernel, device tree
> and initrd for relocation.  Thanks all!

To offer a additional guidance here, in
include/configs/ti_armv7_common.h I did the following a while ago:
/*
 * We setup defaults based on constraints from the Linux kernel, which shou=
ld
 * also be safe elsewhere.  We have the default load at 32MB into DDR (for
 * the kernel), FDT above 128MB (the maximum location for the end of the
 * kernel), and the ramdisk 512KB above that (allowing for hopefully never
 * seen large trees).  We say all of this must be within the first 256MB
 * as that will normally be within the kernel lowmem and thus visible via
 * bootm_size and we only run on platforms with 256MB or more of memory.
 */
#define DEFAULT_LINUX_BOOT_ENV \
        "loadaddr=3D0x82000000\0" \
        "kernel_addr_r=3D0x82000000\0" \
        "fdtaddr=3D0x88000000\0" \
        "fdt_addr_r=3D0x88000000\0" \
        "rdaddr=3D0x88080000\0" \
        "ramdisk_addr_r=3D0x88080000\0" \
        "scriptaddr=3D0x80000000\0" \
        "pxefile_addr_r=3D0x80100000\0" \
        "bootm_size=3D0x10000000\0" \
        "boot_fdt=3Dtry\0
Note that these platforms have a DRAM base of 0x8000_0000.  The offsets
described above are based on Documentation/arm/booting.rst in the Linux
Kernel and were the best-generic-fit I could come up with given those
constraints and suggestions.  I don't know of a best-practices example
for arm64 platforms right now.  While I believe that cmd/booti.c makes
sure to follow the requirements of Documentation/arm64/booting.rst it
would be good to audit it again for any recent updates.

Hope this helps and thanks!

--=20
Tom

--cW27jhpBl+zg4ncD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl4xyHIACgkQh/n2NdMd
dlJ/7RAAukNDILPQW4c/lANc/yofcAy8i/e6gZGfiEqpGE9DIvNNH5LqycFcskMr
zUhLQSArnWIkH2dSUCfDHoLwBFxiCRR/IPjerNUc5zgNTkmBxx8B1FPZsD2h731W
5LJVnqRNre36+/JNC0zA2WThrv+tDtPWn38hfxFYWOSk7mEF3gSvByizl3LBnD/P
J8EKXadlVh9c+HkRdGW4Oprn242dYTjxCm7iQrpCM3a8t1/bczhXwnI1+qvBqJlo
fLFsdzzUOJpaCXN2HynD8i6jVzBQ10ejsEDTFyG/eW6Qej2Ws4hxr4V4ZH8oEmsa
yRSO31sibSmSzP+OHnMEtzdzMGEvzo5gzlyOg5iu4N2wdk4QUZUXORBRG2b8mbZv
ZCmCSPT0aP8tyHSh4debNzfOf/oSDdDl+O9KR+v/9rEbJ6rBy8CJMfwVRZARsTWG
0NB/ZaBa59I6MUnUTDedUFmOFNv0ZoGyahogQ6iQ6HFH+QobhiD1egdfqK5AnVRW
zbRZ5/32uDGRfBLsU/dkbEAc67WVn4BUri8wUZ0D2BppLrnxcCP3U0LadgNRa0Gs
rljN1taSqdVf5geILUaIAbMxrR033PgNoxEkYmBpd5L4iXuOfG4BN5ES0m0C2Hqf
7DjQeU8sNUjzYaLIbhrt+Mw9rrjiKDR+0KcU6BnwHy6UPe8tGc8=
=Px2b
-----END PGP SIGNATURE-----

--cW27jhpBl+zg4ncD--

--===============7365632926032044741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7365632926032044741==--
