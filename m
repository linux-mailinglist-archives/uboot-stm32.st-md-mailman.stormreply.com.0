Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3275B9C7D
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Sep 2022 16:03:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 815DDC63324;
	Thu, 15 Sep 2022 14:03:02 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4AC7C0D2BF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Sep 2022 14:03:01 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id c11so13544189qtw.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Sep 2022 07:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=rfGjJL8PEf66hx2kxY8DymZ1eU8Ne3tQkJ0+dE9l/+o=;
 b=M2Icf7P1P+DJfp+iPDTfXa6Q6I/UsXGNp6/SyXmS15H7Cytw61Lmn9F+4uDER8R0Uf
 InDtRIev+ZhdHrtCJ/4PYXOEJaMNKxAiJ9biJNpBaAbdLt/Rc5ZWz8ad7/NXlO51R2dP
 d0Y089wpoM3R2zRutA753i8DEBv4lNCojMg0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=rfGjJL8PEf66hx2kxY8DymZ1eU8Ne3tQkJ0+dE9l/+o=;
 b=oIEsGDqSEARHdTDI8442/m14CsWBf8rqlRzEYH69NwbAAtZ9TF9PVL+VVmCDFjfCFG
 jGy6Hgwdxurw0iSCVy7S+JW4VxqIN/yrC8chniF8c84S6vzBj2zgLPoOCL3a5taYn7Pe
 5VKfmw4c1eaKcg9hsAfCN4MAOJWy7HpuipWtaXML1oFIqzWC2gdM6kTDGs+orX0O6Zsv
 uxn/rd095iQhZJf3PnD3o9NJ84j/kNumJk9SPoh0wA30kc7/BlzKfiHsBMeOGfsJnFkB
 0otIfq9POjaxMo05/Q/lgjR961FmiCUCMTAakqqZDjNudvpIxXbjPxVV2mAX3WFCEeDM
 b93g==
X-Gm-Message-State: ACgBeo18C1Lv8ppZgfe6f4PMJzawUOcPfE45Zf+Cjv7ioIdpgN7Tht8i
 ZzN0vdmS3QEY3E9eDPx17ZduWg==
X-Google-Smtp-Source: AA6agR6BZhrcccfX6p/cm1GfQaofiHHUn/JiglSgwcJHzbftHtUJkIXP8U7BMFFreNPX96ttD0WFTw==
X-Received: by 2002:a05:622a:178f:b0:35c:b869:6dde with SMTP id
 s15-20020a05622a178f00b0035cb8696ddemr8360377qtk.684.1663250580648; 
 Thu, 15 Sep 2022 07:03:00 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-6011-212c-4988-e1af.res6.spectrum.com.
 [2603:6081:7b00:6400:6011:212c:4988:e1af])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a37f70d000000b006b8e63dfffbsm3969948qkj.58.2022.09.15.07.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 07:03:00 -0700 (PDT)
Date: Thu, 15 Sep 2022 10:02:58 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <20220915140258.GJ6993@bill-the-cat>
References: <20220830120914.2329522-1-patrice.chotard@foss.st.com>
 <20220830120914.2329522-2-patrice.chotard@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20220830120914.2329522-2-patrice.chotard@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Samuel Holland <samuel@sholland.org>, Andrew Jeffery <andrew@aj.id.au>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Eddie James <eajames@linux.ibm.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 1/4] gpio: Allow to print pin's label
 even for pin with GPIOF_FUNC function
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
Content-Type: multipart/mixed; boundary="===============2969821305607649080=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2969821305607649080==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6PtN/jU//tuarfdA"
Content-Disposition: inline


--6PtN/jU//tuarfdA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 30, 2022 at 02:09:11PM +0200, Patrice Chotard wrote:

> Currently, if pin's function is GPIOF_FUNC, only "func" if displayed
> without any other information. It would be interesting, if information is
> available, to indicate which pinmuxing's name is used.
>=20
> For example, for STM32 SoC's based platform, "gpio status" command
> output :
>=20
>    before
>     Bank GPIOZ:
>       GPIOZ0: unused : 0 [ ]
>       GPIOZ1: unused : 0 [ ]
>       GPIOZ2: unused : 0 [ ]
>       GPIOZ3: unused : 0 [ ]
>       GPIOZ4: func
>       GPIOZ5: func
>       GPIOZ6: unused : 0 [ ]
>       GPIOZ7: unused : 0 [ ]
>       GPIOZ8: unknown
>       GPIOZ9: unknown
>       GPIOZ10: unknown
>       GPIOZ11: unknown
>       GPIOZ12: unknown
>       GPIOZ13: unknown
>       GPIOZ14: unknown
>       GPIOZ15: unknown
>=20
>    After
>     Bank GPIOZ:
>       GPIOZ0: unused : 0 [ ]
>       GPIOZ1: unused : 0 [ ]
>       GPIOZ2: unused : 0 [ ]
>       GPIOZ3: unused : 0 [ ]
>       GPIOZ4: func i2c4-0
>       GPIOZ5: func i2c4-0
>       GPIOZ6: unused : 0 [ ]
>       GPIOZ7: unused : 0 [ ]
>       GPIOZ8: unknown
>       GPIOZ9: unknown
>       GPIOZ10: unknown
>       GPIOZ11: unknown
>       GPIOZ12: unknown
>       GPIOZ13: unknown
>       GPIOZ14: unknown
>       GPIOZ15: unknown
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/next, thanks!

--=20
Tom

--6PtN/jU//tuarfdA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmMjMJIACgkQFHw5/5Y0
tyzkiwv9E1j6s+fkFyzE0nbz6g+TAjBCvU52P9GY1Z6Qn+LYKwoMNzhCaPgR/0iD
FXopzSaQx9kyE1MZDTajqtR6NB0QTjbbIkEj3GqZ6n5aaimR7ko+BLZjVgsl2zJU
2yESonm9qVVdv4wyJmYO16fSuFDOsUsChJ5nX4JdsJOqPqdMeXVVR/aPUBzB/I7a
7Ma/QzwkWgd9/6cR+HBb2z8TTGOi8MARirHgv/1mH6NQIJUE3oiaC/xcRvxaTcjj
2nbBcnANK9nSmZznd+MuiWHYWtEJiq3IYxchFQu5n/a5Z8oZjGZKneXVscmXrc0Y
GqyawOPnRDPYAzDRvU/qz/6rUkQ0Nws9ma19Ax50XW/TwGjXpVerCw6dYhHqKWRK
0Mk/S2fOegLEl3RLo6+NM5qqC8rccoqaAQRVWLinHODhxgQVNXIkj7ILoN7oi65s
p8dVePzViCkNunFBJ+VEmgk8BqRbNhGzBcbsVT3qQqkdunsyLbq0qkku1n9KBzTU
egJKDZ/x
=/FL9
-----END PGP SIGNATURE-----

--6PtN/jU//tuarfdA--

--===============2969821305607649080==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2969821305607649080==--
