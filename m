Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AEF42FAB8
	for <lists+uboot-stm32@lfdr.de>; Fri, 15 Oct 2021 20:02:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F9DCC5C845;
	Fri, 15 Oct 2021 18:02:41 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50D7CC5C844
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Oct 2021 18:02:36 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id g17so1285545qtk.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Oct 2021 11:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vbhF4Kx8qVAfHtMwdRpFyarp+5Img/tY+i7r+CYyJwo=;
 b=jI0vZZcV1GfRto2mg3yBSIT1X1Lrzz67J7WE3sltmr3Yz8vv/B0CRA+Xxpko/rQeTl
 sF9VlTbCmRGscTdvAQjbZPhUM63MVexR8TLHzgGFLDtrSYJQnK4ZhrZqUrTOZjJWF3K9
 DO1w++uZsR6FJFWLm04rrS6soemneJnf2+aq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vbhF4Kx8qVAfHtMwdRpFyarp+5Img/tY+i7r+CYyJwo=;
 b=HEf95bOslO8+TkGqKuCDisdz+za1gdKm3Vs/wRH7uOz/mRb3T5hEh5OiSm0vBbJVaY
 nUF0J0nqPrem+/3Hfcw+CkoWJlVDRQ7oY03DwN0IUxlOBfK43llGyg2CpoulwCbSI1VT
 yuekkYeovooYgclpAJGmUdofRjpm2vf9PAJ5k8kdeVhn9hG17Mb+Yz+pNqZWUFtaWxlQ
 QAi/cnhjTSppP6JLGKdnpbKBIemB90165B1P/d7igmvo9K9y2aoU833OkWSo8+3pnlWq
 i+WssazF6reBS6vOGyz9Cd8R2uq2Yo1WXVgeBU0X+gJWDilMzuBsBXhb80U1j9bKHxFU
 K/Ug==
X-Gm-Message-State: AOAM530FR2j5E11hEKwRKVB5BWZb2SycXJbnCl3FV2NXLLtyv3NSegKm
 F3L7Pn4Pj+HUQ1LZlMRE8XTb/Q==
X-Google-Smtp-Source: ABdhPJxJeHl8tiQbnTsonCOu1U7Q37YqIZSAerF4TqY4xgbGH48sqMWLamZVz7JyzOggG3lGJQLCMw==
X-Received: by 2002:a05:622a:189f:: with SMTP id
 v31mr15297565qtc.376.1634320955428; 
 Fri, 15 Oct 2021 11:02:35 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-f8b0-5c25-4d47-ecdb.res6.spectrum.com.
 [2603:6081:7b01:cbda:f8b0:5c25:4d47:ecdb])
 by smtp.gmail.com with ESMTPSA id b20sm3231403qtx.89.2021.10.15.11.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 11:02:34 -0700 (PDT)
Date: Fri, 15 Oct 2021 14:02:32 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20211015180232.GC7964@bill-the-cat>
References: <20211004115942.1.Ic01b4a3063c0b09cac503a4dc8356f5ff64b5c6e@changeid>
 <20211004115942.3.Ibc8e0107187c533ff2b9f71f30b5abfe1e47e22d@changeid>
MIME-Version: 1.0
In-Reply-To: <20211004115942.3.Ibc8e0107187c533ff2b9f71f30b5abfe1e47e22d@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Rick Chen <rick@andestech.com>, Sean Anderson <seanga2@gmail.com>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 3/6] Remove unused CONFIG_NO_RELOCATION
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
Content-Type: multipart/mixed; boundary="===============5267584966859329202=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5267584966859329202==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V/IqgvN47zUHjelV"
Content-Disposition: inline


--V/IqgvN47zUHjelV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 04, 2021 at 11:59:52AM +0200, Patrick Delaunay wrote:

> Remove the latest reference of CONFIG_NO_RELOCATION in code
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--V/IqgvN47zUHjelV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFpwjgACgkQFHw5/5Y0
tyw5Owv7BF0SjAn9DyPeth1JUlv6Lyx8SY4f8hSYQ3zyu/DkcT/VEtnKT+2VO1Y/
0ek7+VLOmuozComp6wxupItDxSdtMU7U9RZ2mXnwOSam/5c40wASfnSDO6aKdgEG
Sdw9cA+SMN9ZC95avP6u4/QAfFM40vG7pkiTdKXQPK9MDI0piy+NlHgIjIz7nEdJ
t1CmxMKU5MMop27NGK6nBmGbUCr8aHpTEmUbjq3BZeOBED49/fKlQz8IwKgpxnWq
b2ED733M/gzy6T/mUb7Ca4m/XJGn2JZlpwuJcuXS4F4j2JzkORuWfyeBIQIWnxqE
eoieflQdwzUE7QG1XkeUyuEklHn5BZ8kl+eYEztJb/NVazPGzxdNheMAHouYXKWZ
PocQaGMdFlhFv5X+XwHFoGIyhQnGyLC4wJ/njjnyA4kiYXKzf1FksB3cN/L2/5ch
AWIdt4pJEd51Lu3925IJcsdOkSff8WbAjzmSiZvrn66xXxSG9hO9nW/1LVaCne+e
qklptvSu
=mIjA
-----END PGP SIGNATURE-----

--V/IqgvN47zUHjelV--

--===============5267584966859329202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5267584966859329202==--
