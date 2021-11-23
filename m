Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 597AD45AEE9
	for <lists+uboot-stm32@lfdr.de>; Tue, 23 Nov 2021 23:17:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15854C597BE;
	Tue, 23 Nov 2021 22:17:15 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F37CC56630
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Nov 2021 22:17:13 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id p4so717758qkm.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Nov 2021 14:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KRH45ClAJPIhk0QtgGD2dPUVvaEwtFciCjj0iPAl7xs=;
 b=O4ZEDGV6w791lVDweCzsiqKWJ11TCnGV0O+pafjmLowrR5GEucm/ymXlIRnUaeXPfR
 /AHdKVBjmihvUSlPAtVHwCDSusdpIWC0WAAJ6ZpSrz/PmSG0IJTG1PYjPYdKrle7hzfz
 fwpQT7I+4ADJ79b2OqDxyacQAK1HU//ReIbzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KRH45ClAJPIhk0QtgGD2dPUVvaEwtFciCjj0iPAl7xs=;
 b=B6+SUedlJ1+ceeuoEpNEY/5F1j3E/l27z6GiB7dta5bvy+1EhjoY6pqfbOxbgIlh++
 /Y/fSH1seklmHEV5WbqAjTL2o11/Xo7TzgXSkrflVxN5PLJi849s87R/YGlQtenLYjo0
 AKI+rl0/06wctqwkIpVwAWPUmzPDUi8jXrb60pepZVbngv33xGBhSjSKBIdQc7330F5P
 KbZZnVA7OJ7nSa8A715mWyOW1CeiTYWLrsuaWLiUzBezelcr/CS1l7+ULfUMBWqW0zDv
 e2VNgPtEXbIAD/SfOe6Zje78MB2XRzq+7AYQ0JqbtbKdymlMyVDIcXAkbh54HgiJXwDU
 8Y7Q==
X-Gm-Message-State: AOAM531F3OGP5t9ov9IlS2/oF8bPgIQ77VYG2vcPIBUCNjHpN1Rh60fS
 1kU1knsR1WOGM+CXMmobCv8SWg==
X-Google-Smtp-Source: ABdhPJxDtO6cAYS0Gor/K0Glqdiie5bUyvDd1zE/LC/oQORQ7Yd5YfZ2ygqGmxFfZRJxsw2yFuZkUQ==
X-Received: by 2002:a37:a081:: with SMTP id j123mr759924qke.503.1637705832283; 
 Tue, 23 Nov 2021 14:17:12 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-2132-1e2a-3644-57ec.res6.spectrum.com.
 [2603:6081:7b01:cbda:2132:1e2a:3644:57ec])
 by smtp.gmail.com with ESMTPSA id l10sm7412557qkp.3.2021.11.23.14.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 14:17:11 -0800 (PST)
Date: Tue, 23 Nov 2021 17:17:10 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20211123221710.GO24579@bill-the-cat>
References: <20211028191222.v3.1.I8edf9d3b9867194e233bba15ce32a1477ce4@changeid>
MIME-Version: 1.0
In-Reply-To: <20211028191222.v3.1.I8edf9d3b9867194e233bba15ce32a1477ce4@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Etienne Carriere <etienne.carriere@linaro.org>,
 Etienne Carriere <etienne.carriere@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 1/5] reset: scmi: define LOG_CATEGORY
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
Content-Type: multipart/mixed; boundary="===============2780607106301600178=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2780607106301600178==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GMq1OpGuLUulEJi3"
Content-Disposition: inline


--GMq1OpGuLUulEJi3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 28, 2021 at 07:13:12PM +0200, Patrick Delaunay wrote:

> Define LOG_CATEGORY to allow filtering with log command.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Acked-by: Etienne Carriere <etienne.carriere@linaro.org>

For the series, applied to u-boot/next, thanks!

--=20
Tom

--GMq1OpGuLUulEJi3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmGdaGUACgkQFHw5/5Y0
tyyF0Qv/b1mnAF3rIzkG8JvnIs/9uCCMs2Qj6Ffg1rnl/p11kWrP5702sNlYoG35
o3ValSxGnxFJlXIHt2yE8hwjwz1+LBLPhGnY5jwVr7Sp3cvQEbpo+DYBw+apS2SX
8kYJdVmgeZl+u36VUgFJ9kpKB8wm1r/ehLx9oWPYaxJn0CxpXotfr5YR4iJ3xIaN
GBVE/SooYPj57DjEr6PjcCXXO/GCGWn+OU8r1jtwpptSZDmBglOcOPvFUXk+B3c7
fVyUcWZdUoYOvsNL1mq0pMU0GaJeQ5XLpo8Tl5AFqbKIE2/65PT1QMJQwGSSVImu
unl8Svil12WS4TCR37Evn4yumXLqRo+0kBF9GheW4fIfQFfFvBDtxi5o7nwCMv8y
0NmENYb831IiPaFjAzLHlChFXtBcMAa5SbP50z4Rek7uJ56hdv9gq5/V0BZP40IN
/PNuXS+MozX1yq8NKf31d2CJNw/4b++jRpkw+8sJQw7+Vp1nKoiXdQqP6DiKdZ9O
uahTEkVv
=XOcq
-----END PGP SIGNATURE-----

--GMq1OpGuLUulEJi3--

--===============2780607106301600178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2780607106301600178==--
