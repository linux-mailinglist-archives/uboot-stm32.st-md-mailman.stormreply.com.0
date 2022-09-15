Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 789045BA0D9
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Sep 2022 20:32:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AF9CC0D2BB;
	Thu, 15 Sep 2022 18:32:08 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82B1BC03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Sep 2022 18:32:06 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id h28so14032805qka.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Sep 2022 11:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=+ZmbDWe7UTXZV86+vkgmLkPvQcelbqxhDXsxU/aHHro=;
 b=AL1TshYfKxARWzkekfsgjsZBekE5bLqbaTRgDoWy/3QzBL52OurggKBZ4Ir/2QgnOS
 fpOYTIy5yBlG26SL+E4bRGETVfA2JAgWUUUwTc0/mjMRXhUlwiJISMPCO9VcFjelKUDn
 faRNbAGTTZEZ52R918zv5GZk2AEOwF6jBoIBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=+ZmbDWe7UTXZV86+vkgmLkPvQcelbqxhDXsxU/aHHro=;
 b=gBbpPlVBuCN+Louu+uWtNMfKvYvQV0I1okXlNJPvKLmXpl/AlvmXKUmspcAEG25NEa
 3u2x+3OQ7AMpAq7SWhYe/hLdyFQyoJv8ixVdEFp3tDEXNggqnLeyACYB081C5oN5GK+d
 TLt0zGKz80RXPZBJVfhBKWcI2JDetb6IYceyBTt7NhhyHQgTiiVvWhxXk+HZaSuvNw8H
 NAAH9JZvpVTO92EjJ6Cp7U0wHRdC5D3SQXjO9M2CW4tdZ1cm2G48YvaVScN3IPUf3YXg
 u16tdIKpICS7tqNq5fime4+AAAG+O8sr+JFai6wCOsenJDYhmhtfGimWI3eF6vWxQneM
 gWbQ==
X-Gm-Message-State: ACrzQf0eAlEc/i1zqDDehNI7bLI+BBuwhbbTMgTJxEC23Mc1VZQhcSDV
 iuDddXbj5cu0Edc9ECaKsIOnL9bsvueSWRzk
X-Google-Smtp-Source: AMsMyM73lxB2ODix4qbFpiPyzCl0pzU0Au+/zOUi65CnG3jmgDAjl+00VzJnGynPLSkcCdWeGXOjOA==
X-Received: by 2002:a05:620a:290a:b0:6ce:afe1:4d84 with SMTP id
 m10-20020a05620a290a00b006ceafe14d84mr1182396qkp.140.1663266725462; 
 Thu, 15 Sep 2022 11:32:05 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-7c7f-be09-1cf9-0c48.res6.spectrum.com.
 [2603:6081:7b00:6400:7c7f:be09:1cf9:c48])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a05620a430800b006bb208bd889sm4457661qko.120.2022.09.15.11.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 11:32:04 -0700 (PDT)
Date: Thu, 15 Sep 2022 14:32:02 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <20220915183202.GP6993@bill-the-cat>
References: <7dc1d636-7b90-6ac3-be94-7512bd4163bb@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <7dc1d636-7b90-6ac3-be94-7512bd4163bb@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>
Subject: Re: [Uboot-stm32] [PULL] Pull request for u-boot master / v2022.10
 = u-boot-stm32-20220915
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
Content-Type: multipart/mixed; boundary="===============1653614854669310901=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1653614854669310901==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WHG05yakhlzm8Hk1"
Content-Disposition: inline


--WHG05yakhlzm8Hk1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 15, 2022 at 05:37:58PM +0200, Patrick DELAUNAY wrote:

> Hi Tom,
>=20
> Please pull the STM32 related fixes for u-boot/master, v2022.10:
> u-boot-stm32-20220915
>=20
> - Fixes on STM32 I2C drivers
> - Activate SCMI regulator for STM32MP15 defconfig, fix the usb start comm=
and
> =A0 for scmi device tree
>=20
> CI status:
> https://source.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/13457
>=20
> Thanks,
> Patrick
>=20
> git request-pull origin/master
> https://source.denx.de/u-boot/custodians/u-boot-stm.git/
> u-boot-stm32-20220915
>=20
> The following changes since commit d6a03711fde2a6c99614af20ee95a9efe7ad23=
2b:
>=20
> =A0 Merge https://source.denx.de/u-boot/custodians/u-boot-marvell (2022-0=
9-13
> 08:19:42 -0400)
>=20
> are available in the Git repository at:
>=20
> =A0 https://source.denx.de/u-boot/custodians/u-boot-stm.git/
> tags/u-boot-stm32-20220915
>=20
> for you to fetch changes up to a22692dd815c20b3fc6354be954ce65922761ad1:
>=20
> =A0 i2c: stm32: fix usage of rise/fall device tree properties (2022-09-15
> 14:59:29 +0200)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--WHG05yakhlzm8Hk1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmMjb5gACgkQFHw5/5Y0
tywbVAv7BzuJF+lon3Woi2NF2ro415RnCqMD7eLP9zWiqMSdkEXQvKHFWn6tKuEd
WUGvqkANwBZNlUJzjSmTDVrxkomXBA1SzfrbarV4pbu/zORw2FF3T/bdo5rS8fvW
RIldEdiOuF4JbftclTvwA4dn4j7epNbDDphle8oUZmw2IzCVMhVU1MyXMxircAHr
QRkqIxmSrwAScqVXVIj/UY6g9PwVsGP9/ZJqXmujyLTa1mlrth5vZ+0mWL5xMb9S
7CLAh5HcmKSB9PTb5X9Es3SVzLxnG2hhmZEwFkThsgTIu+jk23qbzZttb7FqgmOD
Yd8oDkqWdmsN7518HAPtAQ7jDWgvdzSSt0l5b0lig1R3j70FYe0ena7Jb+PdUyyo
tolwswq9CNz1LYN/4ABNgDnGQ+3GcSi3TH+ilkVAxbobKkkhrN9LIbcKaC2AM9ze
//PPSPz1baWdaMdruAE7r6AvNDpqzu74dZEl3O5wA0h879F510QFW8zs1jUSX+89
Biwt3x0/
=adA4
-----END PGP SIGNATURE-----

--WHG05yakhlzm8Hk1--

--===============1653614854669310901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1653614854669310901==--
