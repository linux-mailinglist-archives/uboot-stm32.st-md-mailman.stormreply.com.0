Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C95A564A996
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Dec 2022 22:34:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F46DC65E74;
	Mon, 12 Dec 2022 21:34:57 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FA3EC65047
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Dec 2022 21:34:56 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id s9so9938233qtx.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Dec 2022 13:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5kxntNIck0+l1ZDI7zKHaiD4lecp18iMZk2Mh2cn+34=;
 b=FzKiRrMqV8hczpESlddSGuJ4ump2ack7QAumZCeSSozqi40ukKW35mgaNSrrSfW6wD
 CPBGp0kTzspJxTy3PL7dn+ksrtcIm1GJjYFNweXLqDMmOBzm/wwjdTXLVnp5PR/CTEsI
 MDchgp/pDUczhTJNkZeXRj+9/tbeMOt8hysMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5kxntNIck0+l1ZDI7zKHaiD4lecp18iMZk2Mh2cn+34=;
 b=QKbyaQWnFcn/Nj6TnhOZAolU8KeNAGzGX9JGoTnlBmpqrdnWN2rb6yaqgSYgFzAM7Z
 Lig3UyYPL1FnpG55OxH30bdtAJ749faVN+O8iVMTgKBGCDtERjagBPQU8cpeO5H8kYVE
 zHAjztKaBN6feSG1k7RcV6RKK/yHBDIlDPiAYfMjjUC7+1qqZ5rcrSlGrczkUKYZCWf+
 O3LBj85atgy7oOHHIPf52YMsbP57+puOMXt9GcwDL0uNzzbl6/HU1XaF1w+g4YB2HV69
 PCcv1n+Hs3n9Hyg8dCT+hNgEyZz/dYIqxrMT0AVYBHeuJQkgxA0srmRWREPDavT2eRsq
 UmoA==
X-Gm-Message-State: ANoB5pkzMffpzWyRF24JJi8P47njSlXGkg0YJVPntZ4DhRkHlbSDGzPV
 xJoagGdS7Y5OrZ0ETT5Kcs0TKQ==
X-Google-Smtp-Source: AA0mqf525T97PfZR3qC45x1XWwh6QHlvgkLRbHqwsc1Fnq3JkKQYoEOZn6/S+QKSmbUVsgHRFGVZSQ==
X-Received: by 2002:a05:622a:40ca:b0:3a6:ee87:20e7 with SMTP id
 ch10-20020a05622a40ca00b003a6ee8720e7mr25901482qtb.68.1670880895283; 
 Mon, 12 Dec 2022 13:34:55 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b00-6400-8c5e-02dc-44a6-fa90.res6.spectrum.com.
 [2603:6081:7b00:6400:8c5e:2dc:44a6:fa90])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a05622a03d000b0039a610a04b1sm6602567qtx.37.2022.12.12.13.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 13:34:54 -0800 (PST)
Date: Mon, 12 Dec 2022 16:34:53 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20221212213453.GF3787616@bill-the-cat>
References: <20221028090120.1536827-1-patrick.delaunay@foss.st.com>
 <20221028110055.2.I4662774cdd525de1992f84f0ea97255e2e43d8c2@changeid>
MIME-Version: 1.0
In-Reply-To: <20221028110055.2.I4662774cdd525de1992f84f0ea97255e2e43d8c2@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Edoardo Tomelleri <e.tomell@gmail.com>, Peter Hoyes <Peter.Hoyes@arm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Artem Lapkin <email2tema@gmail.com>,
 Zhang Ning <zhangn1985@qq.com>, Zhaofeng Li <hello@zhaofeng.li>,
 u-boot@lists.denx.de, Ramon Fried <rfried.dev@gmail.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 2/3] cmd: pxe: support INITRD and FDT
	selection with FIT
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
Content-Type: multipart/mixed; boundary="===============0566295386508198850=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0566295386508198850==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ke0KUbML/F2VkA+s"
Content-Disposition: inline


--ke0KUbML/F2VkA+s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 28, 2022 at 11:01:19AM +0200, Patrick Delaunay wrote:

> Since the commit d5ba6188dfbf ("cmd: pxe_utils: Check fdtcontroladdr
> in label_boot") the FDT or the FDTDIR label is required in extlinux.conf
> and the fallback done by bootm command when only the device tree present
> in this command parameters is no more performed when FIT is used for
> kernel.
>=20
> When the label FDT or FDTDIR are absent or if the device tree file is
> absent, the PXE command in U-Boot uses the default U-Boot device tree
> selected by fdtcontroladdr =3D gd->fdt_blob, it is the "Scenario 3".
>=20
> With this scenario the bootm FIP fallback is no more possible with
> the extlinux.conf when only "kernel" label is present and is a FIP:
>=20
>   kernel <path>#<conf>[#<extra-conf[#...]]
>=20
> As the U-Boot FDT is always provided in the third bootm argument,
> the device tree found in FIP is not used as fallback, it was done
> previously in boot_get_fdt().
>=20
> This patch adds a new field kernel_label to save the full kernel label.
> The FDT bootm parameters use the kernel address (to avoid to load a
> second time the same FIP) and the config when this full label is reused
> for "fdt" or "initrd" label.
>=20
> This FIP support in extlinux.conf is restored when the "FDT" label
> can be found and select the same FIP (identical file and configuration):
>=20
>   kernel <path>#<conf>[#<extra-conf[#...]]
>   fdt <path>#<conf>[#<extra-conf[#...]]
>=20
> The patch add also this possibility for initrd.
>=20
>   initrd <path>#<conf>[#<extra-conf[#...]]
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Applied to u-boot/next, thanks!

--=20
Tom

--ke0KUbML/F2VkA+s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmOXnnwACgkQFHw5/5Y0
tyyB8Av/V/UQkQSD3TZF6cP6sDhvjrQ/cPuDUGrgp5EYx7bfVBPPG1U9mskgAxsu
Wki1FGzgnJX+SA82NmlTS3eTf1S5cmJH4ao1ntXbetsaUArhdPNpEMnyesZ1FxVc
YC4bxAiH6fyYAeD3g46cYs2DsnsmmGVY0vDrLMHkJ1K925O2iK51Qtp3kz40kPwY
DVE7AxmDAAhgjC5ecE1eW5SlIc/m341zSi9WwwsH39scniSM4v7jQEb4H2StjZHi
dc/hiJDhydB+uMOKIguuuwkLs25LNjBg+bxarYeb2ZAYRg0AYq8B7WMmekGAvq7T
gc9ykIQpclFvSEojLph9H5GQuZXAeoI9OmVs84OiIUGscNTcVnOTivTTOweawArq
pI+2MO3zyzRhVXwbSig7+DyQMiHykGrGiuWGOYtE3+p506vSrAcpwuPxI4YJAw1n
2qUsIOqBdml4JACwMx8oDjl5jj/N5zgDwn1bT4DDlMh5KtMXZ98gxBzG/N7N4jQq
Nj+GFRoi
=Pq/+
-----END PGP SIGNATURE-----

--ke0KUbML/F2VkA+s--

--===============0566295386508198850==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0566295386508198850==--
