Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C896124854
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2019 14:26:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F182C36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2019 13:26:16 +0000 (UTC)
Received: from mail-yw1-f54.google.com (mail-yw1-f54.google.com
 [209.85.161.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4294C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2019 13:26:14 +0000 (UTC)
Received: by mail-yw1-f54.google.com with SMTP id u139so725128ywf.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2019 05:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wp9M3VsNUgpKP89w9sxSZuN34jU3mxlxdRW1xPYefbA=;
 b=a+wteXu3Vt6OOMbuUcQbZHoX26ARxoJz0YsFHkbE+70wJl+XwOF6m5IZy5SLidx2Ol
 ILt22tZPtqLSGQlwnmF9OGdAtI+391uE05Y4OuxFNvWjqfWou2BLhduZY9A+f+OaF7UQ
 mAZlSArS/VWnvPwbqDokVF9HeOE4Zt2m1vCBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wp9M3VsNUgpKP89w9sxSZuN34jU3mxlxdRW1xPYefbA=;
 b=YU6qyygovNKsiZEbjdN5weWV18jgwcRxCNGBTawNCZbwOuVF9lftpZYgQmsWONC6q/
 cuz9TiPuf9mdWMK1D6nXPL0k1mHnXOla0q2ph2IggFKnzTms+UvfMOP5ZznK5PdRlOhu
 xk5/LSW3YIxjGWtfWTShxHVFBZLPk7jYP5+B0WzwKOnxGtl7Ct+nOcVTOosyuubI28bb
 cvMJMWWYqqB85y5QBogf60cbFwDrf+OBRj/rJwJM6TcwPqOxDHR6tkBHPDSZ5b9rnj5P
 zzXedfGrRNduu4BkrNEhbcdxPGPHUzmTx+VHmbTWt9pzQs8J3uSYORWlVTGSoYO+k2aK
 ccNw==
X-Gm-Message-State: APjAAAXfavIH4Zsmvq64B537mE2epCOiOPuepoUThqzyOFovqseJSFUc
 jf7rPOvTNpHCcM9seL+Mahrpnw==
X-Google-Smtp-Source: APXvYqwEwf2LPGJssXbJ50umpnG2Ght7WT9H58B8yt4N0zhTZvuTYOXHyryozSce/IE/L7hhJ7yj6Q==
X-Received: by 2002:a0d:cb48:: with SMTP id n69mr1967817ywd.48.1576675573594; 
 Wed, 18 Dec 2019 05:26:13 -0800 (PST)
Received: from bill-the-cat
 (2606-a000-1401-86dd-0414-167a-e8c4-5a16.inf6.spectrum.com.
 [2606:a000:1401:86dd:414:167a:e8c4:5a16])
 by smtp.gmail.com with ESMTPSA id 189sm938018ywc.16.2019.12.18.05.26.12
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 18 Dec 2019 05:26:12 -0800 (PST)
Date: Wed, 18 Dec 2019 08:26:10 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Message-ID: <20191218132610.GC18106@bill-the-cat>
References: <38736df3b2ae4cf3b487e83cf5fae71c@SFHDAG6NODE3.st.com>
MIME-Version: 1.0
In-Reply-To: <38736df3b2ae4cf3b487e83cf5fae71c@SFHDAG6NODE3.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PULL] Pull request: u-boot-stm32
	u-boot-stm32-20191218
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
Content-Type: multipart/mixed; boundary="===============4072379567268731466=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4072379567268731466==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7iMSBzlTiPOCCT2k"
Content-Disposition: inline


--7iMSBzlTiPOCCT2k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2019 at 12:13:29PM +0000, Patrick DELAUNAY wrote:

> Hi Tom
>=20
> Please pull the last STM32 related patches for v2020.01
>=20
> Travis CI status:
>      https://travis-ci.org/patrickdelaunay/u-boot/builds/626655770
>=20
> With the following fixes:
> - fix crash for stm32mp1: remove the BOOTSTAGE feature
> - fix warning for stm32mp1: add the missing cls command
>=20
> And I also resync the stm32mp1 defconfig.
>=20
> Thanks,
> Patrick
>=20
> git request-pull origin/master https://gitlab.denx.de/u-boot/custodians/u=
-boot-stm.git u-boot-stm32-20191218
> warn: No match for commit eddd79291d2026f8fefebc3f5d39928d7c649241 found =
at https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git
> warn: Are you sure you pushed 'u-boot-stm32-20191218' there?
> The following changes since commit ef7c2af65966a57c98d3c47e6c2fe1ce2103b7=
f6:
>=20
>   Prepare v2020.01-rc5 (2019-12-16 07:39:56 -0500)
>=20
> are available in the Git repository at:
>=20
>   https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git u-boot-stm32-20=
191218
>=20
> for you to fetch changes up to eddd79291d2026f8fefebc3f5d39928d7c649241:
>=20
>   stm32mp1: configs: Resync with savedefconfig (2019-12-18 11:58:36 +0100)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--7iMSBzlTiPOCCT2k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl36KO4ACgkQh/n2NdMd
dlKCvA/8DWYp+QJP8ZCWvIoKp9TW0u617v9SNZOwCC8czNOrnzDv8UKwhc9fU8Cc
JNodxj4xnlbO/n9xMqOlc9u/0DIp+OhWpBbSMqDjBGBV/JSX6YUeC8OCyT/ADTOT
YHXFBxVNis6TUHz8Uaqxx+Jt1SEx8gOsgvesyXIDMnobDmVdcgptnuIaHVzpkmQ6
D3CJGxlpLbv6XzmHDb/l0JvH6UG53JzOfatLnXgjpILWPguw8VXjoufZ2SDguWcC
geGiYjzJQicjM+NgpM6MOkVIFl6EWG8meiDCSgZxqZ+9jDinBSUsecgpCbjlXyC5
pyyiT7vYHxFjRTVwvcbOeHC0oqIKLRAepM9PUoeYEiHQrAZKFvlq9mQEeVqs69/R
5BFqXcudLaRls8ikAsboHLExWFiLDumt/BjCSo/Ixvrkuu33tlKR+2D4nV+90alK
kHGrZoNZQqlnlobM0mRADsqBj9oGmWwEmTDcRwvCqWYI9vloE3RdBWM0LUZrlAjF
cex5Y4Y910ewE/WXCq8W4F75oNyiLbYThYZLVLIIiqlhes0jWIEewsGDrmZ2uhxV
wLiQ2ytMHs5i6hcQN83wZ3hBT1yUyUJhCZmC+tM/DQEEWZG0tjs/5PxRG6GHo/qn
1QS104I2jLx4BsL4lZjnJGEnfAd7rvw9v37D1L+A8MAPCJ+IMrg=
=jSk5
-----END PGP SIGNATURE-----

--7iMSBzlTiPOCCT2k--

--===============4072379567268731466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4072379567268731466==--
