Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C4D8B1C3D
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Apr 2024 09:52:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15EFDC7128B;
	Thu, 25 Apr 2024 07:52:38 +0000 (UTC)
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB238C6B45B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Apr 2024 07:52:36 +0000 (UTC)
Received: from localhost (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id D4A1E109;
 Thu, 25 Apr 2024 09:52:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2022082101; t=1714031556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=FIsn9QrdcnuxXsiHo1gq8RFsEM13ahz9WIN/K7Zd9o8=;
 b=R+MIOBnLsOi3pmSBCRBLQoNpQf7PSaBNxri8DLRAqV1k8ZX5LkOEI8JPMDBFAPYayx6Oe+
 7UgKHW3+cIEhVEvhb8m+9d9goRnudpwBlSuoFxevwUHq+2zOGeQNewszpvapFD2TLc9O8X
 8BIzWiln73JeeF06NfYZxKk37AuGDWxOwASGIshaFbI0X/6M4+Ofn24s1EGzE9oH5SyoYD
 fslvVhiHGzZBVKqc6j//Z63Zlpx7H6U11PvYTDEf0ifx72gXpAR6cPLSlKD6f6BDjRs5bL
 G86SgrZkytU2JpgBxW8vz2Cfn6PhdT4TTLwu/9jDXDOwN64bhaYL+dNqjX9O5w==
Date: Thu, 25 Apr 2024 09:52:28 +0200
Message-Id: <D0T1H31G99ZV.1I8SXBRR91ECR@walle.cc>
From: "Michael Walle" <michael@walle.cc>
To: "Ilias Apalodimas" <ilias.apalodimas@linaro.org>, "U-Boot Mailing List"
 <u-boot@lists.denx.de>, "Tom Rini" <trini@konsulko.com>, "Richard Hughes"
 <hughsient@gmail.com>, "Heinrich Schuchardt" <xypron.glpk@gmx.de>
X-Mailer: aerc 0.16.0
References: <CAC_iWjJNHa4gMF897MqYZNdbgjFG8K4kwGsTXWuy72WkYLizrw@mail.gmail.com>
In-Reply-To: <CAC_iWjJNHa4gMF897MqYZNdbgjFG8K4kwGsTXWuy72WkYLizrw@mail.gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 FUKAUMI Naoki <naoki@radxa.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Masahisa Kojima <kojima.masahisa@socionext.com>,
 Paul Liu <paul.liu@linaro.org>, Michal Simek <michal.simek@amd.com>,
 chris.obbard@collabora.com, Heiko Thiery <heiko.thiery@gmail.com>
Subject: Re: [Uboot-stm32] Capsule GUIDs and LVFS
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0254921796073200775=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============0254921796073200775==
Content-Type: multipart/signed;
 boundary=741d942a38e8194029a91d31f320dc294341270b6abbd23dc66197ab6cd9;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--741d942a38e8194029a91d31f320dc294341270b6abbd23dc66197ab6cd9
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Thu Apr 25, 2024 at 8:19 AM CEST, Ilias Apalodimas wrote:
> I've cc'ed all the people I could find in board specific MAINTAINER files=
.
> Can you respond to Richard with the proper company name & board name
> so we can bind the following GUIDs to a vendor properly?
> Richard any guidance on how this should be done properly is
> appreciated, since I am not too aware of LVFS internals.

Thanks for taking care!

> Kontron KONTRON_PITX_IMX8M_FIT_IMAGE_GUID c898e959-5b1f-4e6d-88e0-40d45cc=
a1399

This (board) should likely be dropped to lower maintenance burden as
it is EOL and "not recommended for new designs".

> Kontron KONTRON_SL_MX8MM_FIT_IMAGE_GUID d488e45a-4929-4b55-8c14-86cea2cd6=
629

This is probably (at least) the wrong name. SL is a
System-on-Module, a small PCB that will be soldered on a carrier
board and cannot run on it's own and a customer using that SoM will
likely have their own bootloader. There is, though the "BL" which is
the in-house board for this SoM.

Company name is "Kontron Electronics GmbH".

> Kontron KONTRON_SL28_FIT_IMAGE_GUID 86ebd44f-feb8-466f-8bb8-890618456d8b

Company name is "Kontron Europe GmbH".

Both entities belong to the Kontron Group, not sure how this is
handled in LVFS though.

-michael

--741d942a38e8194029a91d31f320dc294341270b6abbd23dc66197ab6cd9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZioLvREcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+E9MAYDQM+Pw5Zk7pl+wZBQSLolTYenKNOvIQYhy
JIx00cdCoLAzaYPJE8XIc3ZlCuCxwBIBf2gNeqS2eGt6p7dzvSpJZHX/7rJYSMOm
1jzDWqOW9YNsecZL2yWcDYXT5rnaVXBl7g==
=uWNl
-----END PGP SIGNATURE-----

--741d942a38e8194029a91d31f320dc294341270b6abbd23dc66197ab6cd9--

--===============0254921796073200775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0254921796073200775==--
