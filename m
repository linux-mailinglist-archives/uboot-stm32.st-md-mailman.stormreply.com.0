Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A84CB10EC24
	for <lists+uboot-stm32@lfdr.de>; Mon,  2 Dec 2019 16:16:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 639BAC36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon,  2 Dec 2019 15:16:11 +0000 (UTC)
Received: from mail-yw1-f52.google.com (mail-yw1-f52.google.com
 [209.85.161.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00468C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Dec 2019 15:16:09 +0000 (UTC)
Received: by mail-yw1-f52.google.com with SMTP id s187so2270981ywe.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Dec 2019 07:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=R/zGyM1pGK6ChzIUR+Sd75zOSrDkJ/6UBtEovIC/ytE=;
 b=aamgA4sbVPuwCpYMMOGXn6hiYh4cBLJ/buOeh1/qZlFT2gcbbHiEJvsk4yjdc7+mn1
 NCVxb/VTZXibKJFeWUZX9Pr0dLb9ULk0fXY6LD2AgX6JHrMPL3jrO/RHe38lnXue5W40
 wTlHfDJOTBtbTO5kt0ddUTj7pk8GyyiyWPzJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=R/zGyM1pGK6ChzIUR+Sd75zOSrDkJ/6UBtEovIC/ytE=;
 b=JGg+Sh5wI+kHqUHqYNGDHJS4TV9YaBZanggXrF5p2A+TNfIoRhdsxfZkn5AUoH5AOs
 0Qc8RsYA4LfDL9pYjhWNpd+3A99nfXWifVOo22OLOFuQQUXnfp2e/zeD3Pri1DNars4P
 0nii23M6IZImIHveXcTI61+0eXfdJ9ubhzgc0JqZz4Y8eCZM+vGw6kxLh49niqkwdkB2
 sWZvI6AJcWw/8SrYBIXeI+iTfl+8PXbMD/NgwYbR0gHHKImh8NOfdJxJwV9PxvpFPdfP
 QAn6heOL2m5LNXbS5rcCOEWMcjdCpAccmHQyBKpl3YBC2P4+q3a7lSa3yQPq/6Quyqwf
 Wocw==
X-Gm-Message-State: APjAAAX7rMEYSioEaXTM4Djh/qXInE4x447O3qr8IzQdFeMt1WuEgtjR
 uJHoABkFYiNs9EluWzHW5r6Tug==
X-Google-Smtp-Source: APXvYqwOMKnNkgaARqNJdtU/ldN+/JEfgFv5IdQvQr/2pn0vgWjdJeoIFoBSnwNntO8dHwPCmdK8Gw==
X-Received: by 2002:a0d:e848:: with SMTP id r69mr6080501ywe.9.1575299768604;
 Mon, 02 Dec 2019 07:16:08 -0800 (PST)
Received: from bill-the-cat
 (2606-a000-1401-86dd-9968-44d6-e18d-7edd.inf6.spectrum.com.
 [2606:a000:1401:86dd:9968:44d6:e18d:7edd])
 by smtp.gmail.com with ESMTPSA id v186sm4843483ywv.34.2019.12.02.07.16.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 02 Dec 2019 07:16:07 -0800 (PST)
Date: Mon, 2 Dec 2019 10:16:05 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Message-ID: <20191202151605.GR15966@bill-the-cat>
References: <efb401d88d4140e2a2fa7f434bf86447@SFHDAG6NODE3.st.com>
MIME-Version: 1.0
In-Reply-To: <efb401d88d4140e2a2fa7f434bf86447@SFHDAG6NODE3.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PULL] Pull request: u-boot-stm32
	u-boot-stm32-20191126
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
Content-Type: multipart/mixed; boundary="===============6200654749212367160=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6200654749212367160==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3TQuZyvpu40ebvIM"
Content-Disposition: inline


--3TQuZyvpu40ebvIM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2019 at 01:42:24PM +0000, Patrick DELAUNAY wrote:

> Hi Tom
>=20
> Please pull the STM32 related patches for u-boot-stm32-20191126
>=20
> With the following changes:
> - Solve warning for stih410-b2260
> - Device tree alignment on v5.4-rc4 for all stm32 boards
> - Correct the eMMC pin configuration on stm32mp157c-ev1
> - Add DFU and SPI-NAND support for stm32mp1 board
>=20
> Travis CI status:
>      https://travis-ci.org/patrickdelaunay/u-boot/builds/617166580
>=20
> Thanks,
> Patrick
>=20
> The following changes since commit 4b19b89ca4a866b7baa642533e6dbd67cd832d=
27:
>=20
>   Merge tag 'rpi-next-2020.01' of https://github.com/mbgg/u-boot (2019-11=
-25 12:56:27 -0500)
>=20
> are available in the Git repository at:
>=20
>   https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm=
32-20191126
>=20
> for you to fetch changes up to b4fee1610864036c8363e552f8547e99b1100f0b:
>=20
>   stm32mp1: add support for virtual partition read (2019-11-26 10:14:35 +=
0100)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--3TQuZyvpu40ebvIM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl3lKrUACgkQh/n2NdMd
dlJO4g//SIqS4pEBwKdKtMTgYtBYxO0Bz9G/TuOy0+IAv7XFyf2Wzx9Z4UKUYV0x
PGgQaAh0Ynd8tys6aniWucN56gMissB5bE5BDdxC6C8tf4skyICT7h/+yYYwSano
9liKamfHbF74T5S9nbIw70GpldlqpnuUR6qQd/U9oNZ/wD7ZdNBsVxHWJ/nORcFv
kHfZYodGVUhEH5fAZWbWtySPRmHd0VDjrbE2LFH6Cl0dClbZC0+bdqmoAcnOpLgR
GXMsdru9j0z8wYuKOnvgsjAyAVWsEMqy5NB7WcOH6QFOkh0YwbTa745y02ncr1v4
+QQ2b0jUI02MayFkJ54WZqaTeUmSJu87+2FSNJnXKDKBwW+kpvL2byjoVFvcJlZS
br/U3OQBokFv0XY6csed3tFv1dZ4G6WeT84/2KHGI9rmmfgCZlnnzby6hCYF+qbD
OBlpnaz+BgyzOqr4/DSzWdS3wD1om8Tb0fR51GUwfeaj1/lin51R9MsHKvx6aWfv
h7IPUxG9LUphFOIsdvMReXUqn0KvIy1gwR2aBuGmYOVZ+9HXY4vrVAPkzHTgGPLh
aQtFTaPgiVRCV3TI10S0V6oaKrP4mGxxZuA8sLn8tizLMnSZRWMu0vT0TWcLIAqi
jDgpZnVfaIYyGp+f1rpZWfdLSQuT/t9E54d5S5lk1rW1+3fmQN8=
=Kfhf
-----END PGP SIGNATURE-----

--3TQuZyvpu40ebvIM--

--===============6200654749212367160==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6200654749212367160==--
