Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4381AE724
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 23:06:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9500FC36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 21:06:01 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3ED06C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 21:05:59 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id t3so4030029qkg.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 14:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mOADQbAcF2bpoy/d2vMpjRN51G/BzARyqyFa68tBcQY=;
 b=XXx5ej+BTLih9AcxHij5sHi/gYCS80Yc7sT9Ln/w3XicbJt37WoCHVN8Ia2TrPsbj0
 /4gPVjKoEogZFS1m5ZGSssGyMafeIA8urYTZeFp11e1oUSy1bn7+wXYr44FAtwhoHH40
 AxeUkN3DGBqEJQOQVq7HL82mQCAiyKeQ/9Z/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mOADQbAcF2bpoy/d2vMpjRN51G/BzARyqyFa68tBcQY=;
 b=WiqzCKrUJheu4Fwl7c1yq2w0CCoHckkLRWT+YfaENl4Qkyh11zK2lxXXyY4YVxQiXc
 gfxFsYbJJ38bleLPl3ealKTlRLvvyLbzg4zvrTSuShJBqy2tOQlb7jouMa/JywyRTdBl
 QzBMOlf+GoSIlAfxSciVdszrrVs4Jbzo6sERbigJR9Qkdsqw/7ijs4CJNaDXcecfcrwm
 xLmFtQZctcrOKAT4Psuakp5Kp6AfOK9FwQtQWXQLyrM22zM3bgHGBb1BxWoEd/uXSoTR
 GcTjN6xsEY42Y/yfEd3y4lbpZKN4CD/+G9K4CXBV5dbI0DMwegJ8SiwuK2R77FE77Vmi
 fgzA==
X-Gm-Message-State: AGi0Pua4tOzPBcTOkKuLP1evZYmbvmeWMbST+M+7TxxHrKdmpxr0eDYn
 Yx/uNXcZ3jFkpz5dKpi4r4vFbLNUlcY=
X-Google-Smtp-Source: APiQypJUUUeAgeOg7owJ1FCPvMAEyk+n8Iq8+tmllsIfowc5lQkQwdJNld8YTpbjliYMbKCtR5f5ZA==
X-Received: by 2002:a37:6691:: with SMTP id a139mr5430054qkc.501.1587157558066; 
 Fri, 17 Apr 2020 14:05:58 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-4058-2b78-ede2-0695.inf6.spectrum.com.
 [2606:a000:1401:826f:4058:2b78:ede2:695])
 by smtp.gmail.com with ESMTPSA id j8sm19016886qtk.85.2020.04.17.14.05.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Apr 2020 14:05:57 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:05:55 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200417210555.GI4555@bill-the-cat>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-3-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200113103515.20879-3-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 02/21] dm: core: add ofnode and dev
 function to iterate on node property
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
Content-Type: multipart/mixed; boundary="===============1416086867043369534=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1416086867043369534==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qrgsu6vtpU/OV/zm"
Content-Disposition: inline


--Qrgsu6vtpU/OV/zm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 11:34:56AM +0100, Patrick Delaunay wrote:

> Add functions to iterate on all property with livetree
> - dev_read_first_prop
> - dev_read_next_prop
> - dev_read_prop_by_prop
> and
> - ofnode_get_first_property
> - ofnode_get_next_property
> - ofnode_get_property_by_prop
>=20
> And helper: dev_for_each_property
>=20
> For example:
> struct ofprop property;
>=20
> dev_for_each_property(property, config) {
> 	value =3D dev_read_prop_by_prop(&property, &propname, &len);
>=20
> or:
>=20
> for (res =3D ofnode_get_first_property(node, &property);
>      !res;
>      res =3D ofnode_get_next_property(&property))
> {
>      value =3D ofnode_get_property_by_prop(&property, &propname, &len);
> ....
> }
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--Qrgsu6vtpU/OV/zm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6aGjIACgkQFHw5/5Y0
tyxjFQwAqq/eVWDK+TbIFIuJMgwBP2172T3ypxOL8mBvayFJ0dYH1X1QPWEVbi/h
jk6hYipgd4LRuSOQtfTff6jjHBmDR2vzlJpa7acCp5Wlq5vtNMrxBgwPc/1laKEb
DxvYg0aSVh+oSSWdlR4EHcTrcBt2ZEB96BtXxHVbogi1I8GV7ITgpVORJSRHcVXm
NwIFvJa88/ocJEDvP1+62XmdjqBRdZGpt0Tc7IAbX3LqTtwIwfGxBv7ANiC1Q4hk
QKWNLUA9o2BpKYIBjpAV1nydAU94GCUNvfEXx+ilOQXdtE8p58G1Cjq2itxchgrD
YocnkmvDNJ8urxJJS+RSGBeP7a7r0hUrQyquCIirCZeAaKfGLrG+l3RIU6ztUMHO
5tfXSLNCzmm0I1KfiT/89YcaIyMgA/8LEvyeT24ceOSntwmyVLitf+onkWMcjUvh
yoDv/a5xtbbC3Hh/MOedRJchUq6LyQ18EYPHnb2EX+UmHdYKJd2Ijt90NARAI0Ic
I/yR1SsN
=m2f/
-----END PGP SIGNATURE-----

--Qrgsu6vtpU/OV/zm--

--===============1416086867043369534==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1416086867043369534==--
