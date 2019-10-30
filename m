Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAE5EA219
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2019 17:52:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C655C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2019 16:52:28 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 168E1C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2019 16:52:27 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 473Dyf0l8Rz1qqkf;
 Wed, 30 Oct 2019 17:52:26 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 473Dyf05Jgz1qqkG;
 Wed, 30 Oct 2019 17:52:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id nSBvq0W8yLmN; Wed, 30 Oct 2019 17:52:23 +0100 (CET)
X-Auth-Info: I6KLYCCny8u0G8GyuIFuRmmLSPPLOujD0M2VbTYYhak=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 30 Oct 2019 17:52:23 +0100 (CET)
Date: Wed, 30 Oct 2019 17:52:16 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Marek Vasut <marex@denx.de>
Message-ID: <20191030175216.02c05835@jawa>
In-Reply-To: <20191029001654.3166065a@jawa>
References: <20191015094536.2c5bbb8f@jawa>
 <b17362c5-f4b2-4e5b-360a-0ad026e5ed4d@denx.de>
 <20191015140307.3940831d@jawa> <20191028175144.5718cd05@jawa>
 <96c77fb2-95dc-f76d-9f77-4576fc1a658f@denx.de>
 <20191029001654.3166065a@jawa>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Ralph Siemsen <ralph.siemsen@linaro.org>,
 Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [Uboot-stm32] [GIT] Pull request: u-boot-dfu (30.10.2019)
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
Content-Type: multipart/mixed; boundary="===============5648896831990614354=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============5648896831990614354==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/vhXKu83c+1aKAyOFCW=fQ5l"; protocol="application/pgp-signature"

--Sig_/vhXKu83c+1aKAyOFCW=fQ5l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Marek,

The following changes since commit
7f0d5fa97074690dcbfcbc902f99c8dab0bff24d:

  dwc3-generic: Don't fail probe if clk/reset entries are absent
  (2019-10-28 23:47:45 +0100)

are available in the Git repository at:

  git@gitlab.denx.de:u-boot/custodians/u-boot-dfu.git=20

BRANCH: master
https://gitlab.denx.de/u-boot/custodians/u-boot-dfu/commits/master

Merge TAG:
https://gitlab.denx.de/u-boot/custodians/u-boot-dfu/-/tags/u-boot-dfu-30Oct=
2019

for you to fetch changes up to 60af9f0fc2e94d105c617cfa32a32ec411e23192:

  dfu: add callback for flush and initiated operation (2019-10-30
  10:00:29 +0100)

----------------------------------------------------------------
Marek Szyprowski (5):
      gadget: f_thor: properly enable 3rd endpoint defined by the
protocol cmd: thor: select DFU subsystem also for 'thor' download tool
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


Travis-CI: https://travis-ci.org/lmajewski/u-boot-dfu/builds/604863805


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/vhXKu83c+1aKAyOFCW=fQ5l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl25v8AACgkQAR8vZIA0
zr19cgf/cPv7ZZn+8szVgPBzbdXgEAExx4rJ/qZ5td9wUhqOALoRMD5oJ3cHxPDP
OnI35v/1gKPyOKaVTe+VDCRAFzmNixuGukRyJSm6UlKoq04k0QMPEKDvj5fdLGrE
sE4qU1f8jdls9GHzVrTg1aTteNqqvjXsLqaGrzHfSI48YOS0shQfFUTaeN6DkiC4
ezDEFDhWWmqhClQ4kMUWJ/OVlaiecJzZuyerXeB95b7KZWYN5HG4QRR6jjJogfpO
GT6oOGv37BUQ/C1hnFku0zHeUyWUoabDUrykAEzCpY4KuMYXdhC7Dub+vbgPnaD6
zq4tS4uRLQbyMrEWzVsZW6yMEEnKaw==
=8RUx
-----END PGP SIGNATURE-----

--Sig_/vhXKu83c+1aKAyOFCW=fQ5l--

--===============5648896831990614354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5648896831990614354==--
