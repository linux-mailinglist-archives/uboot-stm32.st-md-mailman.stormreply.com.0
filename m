Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 043DC2F6254
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 Jan 2021 14:50:00 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5284EC3FAD6;
	Thu, 14 Jan 2021 13:49:59 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DB5EC36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jan 2021 13:49:57 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id r9so11186872ioo.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jan 2021 05:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1BAPpIPyKVbR6zDq0HmQAekPhIYspzHxIUGXX4GeaTk=;
 b=C18tZVWMcqJfaj7WSrz8/B3m/X7ZLzzjYbcwC/8xLzyeU239wgAt3zdBXftKQ0vimT
 ZIJgA89N16xCJWIyxSOPUF626CPGnafzHWu7j4uNdRG8Us/VVwP1xo+Vp65moUAnv7lH
 1FuDjOsswgG9r+6tlNQ9kTxKPsa9xPK7ZnF8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1BAPpIPyKVbR6zDq0HmQAekPhIYspzHxIUGXX4GeaTk=;
 b=BNG4s3tqscRm5nVWJa38jToU0utovg1xoLaTn/8F2UmkJ66EqCM9IYQSrV2SkHxwL6
 U7fk1ddT+v1OnW+bBcHf6SC5ET5AAerA0VelmW0jrC26OORVy39I/MOfuNUZ/15cCGMZ
 7RY2xlNpeRAKtBF9PRz6sRjCRmuTSCPC98FCtitOjfupiDSCpn17MyHcKqt5WFSNpArd
 M4cvfmXv9erT/EvLEexQuZ0VNv0dUKy328qCjxmqt2nmoUtynCryHDEfQ4yqJn4lVgH+
 LRvJ5BRw7ywME2QwZLuIztY0Td3ijKBYDXCTCed4tBVJCRRtXNODcQk8Yzay+rTZUSLf
 h/vg==
X-Gm-Message-State: AOAM533bgvO8nVgxk66I/TYTmKCAsAd08WVU5r3UXrkTxyYCAGzQegBP
 pJp3Xz7i+QHDynYwCeY9wWYYZdZjjV8zfw==
X-Google-Smtp-Source: ABdhPJxBh69ygBT33MojOuZ8DbmkK8RbRyhDYm17+yfcwLurrm74clk7APHNcZHF6sIRmN22d+BT/Q==
X-Received: by 2002:a05:6638:2a5:: with SMTP id
 d5mr6360328jaq.92.1610632195939; 
 Thu, 14 Jan 2021 05:49:55 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b42-3f4c-696d-7638-1a6a-797c.res6.spectrum.com.
 [2603:6081:7b42:3f4c:696d:7638:1a6a:797c])
 by smtp.gmail.com with ESMTPSA id y13sm2625977iop.14.2021.01.14.05.49.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 14 Jan 2021 05:49:54 -0800 (PST)
Date: Thu, 14 Jan 2021 08:49:52 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <20210114134952.GN19813@bill-the-cat>
References: <f7e2366f-36be-4472-9894-e73def85bc5c@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <f7e2366f-36be-4472-9894-e73def85bc5c@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PULL] Pull request for u-boot master / v2021.04
 = u-boot-stm32-20210113
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
Content-Type: multipart/mixed; boundary="===============6160107896706307622=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6160107896706307622==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0kRkyLZR5zsR9u2P"
Content-Disposition: inline


--0kRkyLZR5zsR9u2P
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 13, 2021 at 11:30:37AM +0100, Patrick DELAUNAY wrote:

>=20
> Hi Tom,
>=20
> Please pull the STM32 related patches for u-boot/master, v2021.04:
> u-boot-stm32-20210113
>=20
> - Enable logging features for stm32mp15 boards
> - Update MAINTAINERS emails for STI and STM32
> - Activate OF_LIVE for ST stm32mp15 boards
> - Switch to MCO2 for PHY 50 MHz clock for DHCOM boards
> - Correction in stm32prog command on uart: always flush DFU on start comm=
and
> - Update USB-C power detection algorithm on DK boards
>=20
> CI status:
> https://gitlab.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/5859
>=20
> Thanks,
> Patrick
>=20
> git request-pull origin/master
> https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git
> u-boot-stm32-20210113
>=20
> The following changes since commit ee6726be4f0dccb612f0193c62ca149164c8a5=
af:
>=20
> =A0 Merge tag 'ti-v2021.04-rc1' of
> https://gitlab.denx.de/u-boot/custodians/u-boot-ti (2021-01-12 09:32:48
> -0500)
>=20
> are available in the Git repository at:
>=20
> =A0 https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git
> tags/u-boot-stm32-20210113
>=20
> for you to fetch changes up to 7ccaa31380a4abb2b23718008a54fe2917db8edf:
>=20
> =A0 MAINTAINERS: Update STi and STM32 maintainers emails in remaining fil=
es
> (2021-01-13 09:52:58 +0100)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--0kRkyLZR5zsR9u2P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmAAS/0ACgkQFHw5/5Y0
tyy4IAv+Pnum4UwzwsT9irQrFhuYXK4XXVu3IWhIUVod5DKGS4dm/GNa1ZbrkeQ6
5mzbbCwO6SGsVT7qenvYFiKfHQIvO808JEvPk9VmcOuV5R/hhL9cTdNgdM6GAmZi
EuWnWl+HYVPCwCKxisNX2V6f/sInDKHo9GU8CAPUbOlbdeAaQU+3r96hod1e8n5f
7K46HsUYZ6svOXPoqW2ZUYAG+40gVE7v6Se2OQH4RlMBLYOXdDkrZJmOlIEqpVie
KjCe13l/PfkpYlJyhj19KpgIlPSuwu5bw+HHtPKvvbk2jv4Vsoo4OnBsQCsVc7xj
Cz+LBd62rO0NMrhBWQnwnc9VWYGx9JL8Ne9g6MKKpXallyk3eulZ79FbWHtU3MxY
HEChTMC0sZOM1K/Pk3vnQOVY75eLnqy3r2Bw8ljw6GNlf7IXtT2kwRpja8jSVSCG
rYEI4Nlyzkvn2hjfmY5QTw4JAyANbis0LYPmtjjiDXj8JNYAlsfqHI5swluZ2pGM
hgNhkJV0
=qjqg
-----END PGP SIGNATURE-----

--0kRkyLZR5zsR9u2P--

--===============6160107896706307622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6160107896706307622==--
