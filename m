Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1235D7060
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Oct 2019 09:45:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 659DBC36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Oct 2019 07:45:47 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DA73C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2019 07:45:46 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46snXn5r1Cz1qrKK;
 Tue, 15 Oct 2019 09:45:45 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46snXn50wzz1rD6H;
 Tue, 15 Oct 2019 09:45:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id Wllye_n7emVw; Tue, 15 Oct 2019 09:45:43 +0200 (CEST)
X-Auth-Info: B6eJiG8JOJqvuMPXMFbSsv70X7xTjvmQ9XADLRLGlfg=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 15 Oct 2019 09:45:43 +0200 (CEST)
Date: Tue, 15 Oct 2019 09:45:36 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Marek Vasut <marex@denx.de>, u-boot@lists.denx.de
Message-ID: <20191015094536.2c5bbb8f@jawa>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Ralph Siemsen <ralph.siemsen@linaro.org>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [Uboot-stm32] [GIT] Pull request: u-boot-dfu (15.10.2019)
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
Content-Type: multipart/mixed; boundary="===============5506244630849013769=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============5506244630849013769==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/pHZ8UBWJ_AgX+OzNR.j1Cpo"; protocol="application/pgp-signature"

--Sig_/pHZ8UBWJ_AgX+OzNR.j1Cpo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Dear Marek,

The following changes since commit
7a779ed1755c2d5011bd9598da90291f759ae760:

  travis: Exclude MIPS from the bcm job (2019-10-13 11:21:56 -0400)

are available in the Git repository at:

  git@gitlab.denx.de:u-boot/custodians/u-boot-dfu.git=20

for you to fetch changes up to 5d897631065bb2f36bbc1bd7fabb670ce5da3ce8:

  dfu: add callback for flush and initiated operation (2019-10-14
  12:26:19 +0200)

----------------------------------------------------------------
Marek Szyprowski (5):
      gadget: f_thor: properly enable 3rd endpoint defined by the
protocol=20
      cmd: thor: select DFU subsystem also for 'thor' download tool
      dfu: mmc: add support for in-partition offset
      dwc3: flush cache only if there is a buffer attached to a request
      thor: fix error path after g_dnl_register() failure

Patrick Delaunay (10):
      dfu: cosmetic: cleanup sf to avoid checkpatch error
      doc: dfu: Add dfu documentation
      dfu: sf: add partition support for nor backend
      dfu: prepare the support of multiple interface
      dfu: allow to manage DFU on several devices
      dfu: allow read with no data without error for EOF indication
      dfu: add backend for MTD device
      dfu: add partition support for MTD backend
      dfu: add DFU virtual backend
      dfu: add callback for flush and initiated operation

Ralph Siemsen (1):
      dfu: dfu_nand: reduce verbosity

 cmd/Kconfig                 |   1 +
 cmd/dfu.c                   |  21 +++++++++-------
 cmd/thordown.c              |   3 ++-
 doc/README.dfu              | 270
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/dfu/Kconfig         |  21 ++++++++++++++++
 drivers/dfu/Makefile        |   2 ++ drivers/dfu/dfu.c           | 145
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++-------------
 drivers/dfu/dfu_mmc.c       |  13 ++++++++-- drivers/dfu/dfu_mtd.c
   | 311
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++
 drivers/dfu/dfu_nand.c      |   2 +- drivers/dfu/dfu_sf.c        |  56
 +++++++++++++++++++++++++++++++++++++++++-- drivers/dfu/dfu_virt.c
  |  49 ++++++++++++++++++++++++++++++++++++++
 drivers/usb/dwc3/gadget.c   |   3 ++- drivers/usb/gadget/f_thor.c |
 7 ++++++ include/dfu.h               |  71
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++ 15 files
 changed, 944 insertions(+), 31 deletions(-) create mode 100644
 doc/README.dfu create mode 100644 drivers/dfu/dfu_mtd.c create mode
 100644 drivers/dfu/dfu_virt.c


DFU_PR: Travis-CI (green):
https://travis-ci.org/lmajewski/u-boot-dfu/builds/597562672


Merge tag (for information about the changes / new features):
https://gitlab.denx.de/u-boot/custodians/u-boot-dfu/-/tags/u-boot-dfu-15Oct=
2019



Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/pHZ8UBWJ_AgX+OzNR.j1Cpo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl2leSAACgkQAR8vZIA0
zr0MqAgAygk2fAAsZPL+2K+p9NAdBoeoxcLnhILuR3gZEIY4/YQsdCrvlGWa7usx
+mm5ei3lfVVXmLUUu8L+wi8UHJ1PZYV5uPAd/LGq/USP4KXRSqQMpfoxEAOGeiQ4
I3XStXPT+eon5T/3Uc1ttN1RoKjaEoKtuUfgWp1fXBkThtiqT43/204Zb+/lc1D6
4i2dtTW8KLtNygYUkjp/pZnUrS8s7WJGQf9jodYq+tQt1gXJkgRWi8e+zORYp9up
EYB/9imWfZMxAwn+q2j0IYlNcmb1iUG9wQmz+biipaamdajIjPVog8FLHSAyMDpS
RfnjbNhgnD3ADHTl1DFbXitjg0OUIg==
=r/jl
-----END PGP SIGNATURE-----

--Sig_/pHZ8UBWJ_AgX+OzNR.j1Cpo--

--===============5506244630849013769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5506244630849013769==--
