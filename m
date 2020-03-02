Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B5B175F97
	for <lists+uboot-stm32@lfdr.de>; Mon,  2 Mar 2020 17:28:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98861C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon,  2 Mar 2020 16:28:52 +0000 (UTC)
Received: from mail-yw1-f53.google.com (mail-yw1-f53.google.com
 [209.85.161.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6401C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Mar 2020 16:28:50 +0000 (UTC)
Received: by mail-yw1-f53.google.com with SMTP id x184so326371ywd.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Mar 2020 08:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4N8RyNr0lupjjLJdRxMcYkRPatYNwC5cSDWvKCJQbvg=;
 b=TGijbPQGNwfRrFis15GhCjCw7lx4eGKB5m7Z5Ceq/HmNctfj8+5CX8PWWHkqpIAQXW
 HxYsSW9HA2v4U1ezefENjdHHzTNM3Rcp8JCza33FIeaKdY4Wb7N0UW+9sGqnLvygdnVN
 8yhxlFn3f10BkYssc34vdnoz+nzDTToa6GRoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4N8RyNr0lupjjLJdRxMcYkRPatYNwC5cSDWvKCJQbvg=;
 b=KzYHEImrfN1i7bCtOKHdJHqDsO+ctjlQgYix/7Fidm9TUP/sSyTUfrHcikCZ8XIIn5
 LOJjHyVtzW223Q8AIP5NPAHMVF70hKLPRqeztt+LJSKR7vDauatrGwGc/Rw7BjG5YDeT
 DdhsDoPfqzQY6HLJ4Dka6BRTrjnlVRka+A4GeiyQacdXJdzJHp341SDng5D2mvA/R9Ax
 FPr3NwluaccQTvoqH+6vLp0nnWEfupz4DKc0+eSaK4pFIPNYz2ty1Rc8Zmyvd7/s8eBN
 vxdMrxzeuj8RO4KSQ+++HQ8lSdlXG9nNv/Vhc64f9RrS+DElTcmVPvrK4zb0r3JqFgm/
 +hVw==
X-Gm-Message-State: ANhLgQ1BW3Jol3b0yDAyqqz3V6izpSbGUqBYqD900ByEQDLp1X9/jJVq
 pKMZQ0TGrVkmDT3hRCn2k56VZA==
X-Google-Smtp-Source: ADFU+vtDZL44s/SIr5h8tGOV9IxxO4uC1vltFdFzf+WGGgTcc/+IcvDrp8me1Q/xD8LJvBoJBxabQA==
X-Received: by 2002:a0d:fc82:: with SMTP id m124mr191326ywf.174.1583166529519; 
 Mon, 02 Mar 2020 08:28:49 -0800 (PST)
Received: from bill-the-cat
 (2606-a000-1401-86dd-b86b-09ba-a92a-fdc2.inf6.spectrum.com.
 [2606:a000:1401:86dd:b86b:9ba:a92a:fdc2])
 by smtp.gmail.com with ESMTPSA id q63sm4747936ywg.106.2020.03.02.08.28.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 02 Mar 2020 08:28:48 -0800 (PST)
Date: Mon, 2 Mar 2020 11:28:46 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Message-ID: <20200302162846.GA18302@bill-the-cat>
References: <e2201a558c034386a9c2397b956b590c@SFHDAG6NODE3.st.com>
MIME-Version: 1.0
In-Reply-To: <e2201a558c034386a9c2397b956b590c@SFHDAG6NODE3.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Marek Vasut <marex@denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PULL] Pull request: u-boot-stm32 =
	u-boot-stm32-20200203
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
Content-Type: multipart/mixed; boundary="===============3194038845400179414=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3194038845400179414==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9YwYHZa7lvWObeAc"
Content-Disposition: inline


--9YwYHZa7lvWObeAc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 02, 2020 at 12:24:51PM +0000, Patrick DELAUNAY wrote:

>=20
> Hi Tom,
>=20
> Please pull the STM32 related patches for v2020.04-rc4 =3D u-boot-stm32-2=
0200203=20
>=20
> With the following changes:
> - convert stm32mp1 board documentation to rst format
> - fix in stm32mp1 rng driver
>=20
> CI status:
>      https://gitlab.denx.de/u-boot/custodians/u-boot-stm/pipelines/2334
>=20
> Thanks,
> Patrick
>=20
> git request-pull origin/master https://gitlab.denx.de/u-boot/custodians/u=
-boot-stm.git u-boot-stm32-20200203
> The following changes since commit 9e1d65f36b83c5422ece3c0ea28d07a2246cb0=
7f:
>=20
>   configs: Resync with savedefconfig (2020-02-28 13:28:38 -0500)
>=20
> are available in the Git repository at:
>=20
>   https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm=
32-20200203
>=20
> for you to fetch changes up to efa667d38bb8bdd548972e10d02d830d9256602d:
>=20
>   doc: add board documentation for stm32mp1 (2020-03-02 09:41:32 +0100)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--9YwYHZa7lvWObeAc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl5dND4ACgkQFHw5/5Y0
tyymmAwArnhfwIe0z4ADDgJGc+4FWoQ0j2Zz+rRa08lTGyaHGS0REUMpHPfIeq0m
MsUvwhOEB60AHYX+tygs72mwG56i65gWkRMv4mX0KmEJPBclp/5Qu9rbTJhBF61O
ZAArEbMEFRLQGUFheG6FHXUeX3AFB49dD5leGb1oYbMbvWLVEr3yTD05NBxbVzN7
dHH7DYb7EZ2WnOCh+k6a0Szoe29QnrMwMfoVPnubQnQL1omBAYuRu1AfGJU08tQQ
s0VdSb0IgaeqnpIWPU3FdS9JOLKzlKOiJu1RkobKUDlx61VebnfYZZ78cTL3yCxr
TREXxsr1iVqP6XQglNa+6p08djfmnTQWOapigd9rowTge7KHRxMtvDvBC6tGEq9s
5toEbzFvxczkCcqDF0f06++7TSKnNeO1vN3g6EEFPufhznhSJY1cEqb5jWfci9oe
Yc1JGwYn4bOV//jnMkci56CjlPEEDhC7InGfVO/YE+rjRdhfg+0752IosiVldZiA
qx2f3C9y
=vgqp
-----END PGP SIGNATURE-----

--9YwYHZa7lvWObeAc--

--===============3194038845400179414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3194038845400179414==--
