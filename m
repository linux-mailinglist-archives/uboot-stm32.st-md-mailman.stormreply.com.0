Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C2348F6E0
	for <lists+uboot-stm32@lfdr.de>; Sat, 15 Jan 2022 13:37:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8DC20C60461;
	Sat, 15 Jan 2022 12:37:49 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6AD15C5A4FD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Jan 2022 12:37:47 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id c7so10028712qtc.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Jan 2022 04:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=k2/ev3zVEL1CGzgrFcUiP81NDl33aDwsOQ8BshfzaYo=;
 b=NZ85QPc4iogZbyyNIRAvKfzSdj5D/tzFH/aFyOijo+rPzbq8qzJiZTgwd444Ye2Ksb
 3PTboXh+YqIXBloZ4JkStXqkoZTL9f2WDywlRvJCXTI3/bk1s8lwD76Oi/Z5ncndaBEw
 S+pNgpQdRr88TbG4hLnXjcY5HbeJYzom7X/Hw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=k2/ev3zVEL1CGzgrFcUiP81NDl33aDwsOQ8BshfzaYo=;
 b=TAs9jShFfne2kkHPjsEPwGmoEvleJMqIU4G+QXgbS7H16Y2HOwh4PIUjsOWdN/ZL++
 XjVCA/HNbMXyxnX71sgp3mh7nqCYypJpkEtbZo6IRlq7SNSuryj/Ofvf1i63MHkGj4GT
 HTv0ggAb+IjF01SJmZz3NRvT59dpMC67iqchPzj64T3JBDBFLnq4amaSn/RNy1O5BHi9
 aOXB+zlO+X7fuOW8Kh1CvPPJxHzF7dlyxFF6oFsOikBt3OwLSee4Z1KT50FJgeFnq5yl
 9egw2MaSOYziuIBkWLqZ7x0KaCS1oNCjBKjF5RQybIDchCI6/iCpRbEuc7oN0QTGeIH2
 csFg==
X-Gm-Message-State: AOAM532aOF1oTSJxzOkKnEmR/h9wAenSsBoO5vOQdZwmVJlGpzOyUpW7
 dqVGSM9jXw+TNqg7OfYEs3ckAQ==
X-Google-Smtp-Source: ABdhPJzgLXtyLEQV4bbk9HWW20wWaVBozXyL+REr+9LZ/udgWOSXByuKy/c8kyC6soeVm2e2ANPqjQ==
X-Received: by 2002:a05:622a:34c:: with SMTP id
 r12mr10904388qtw.403.1642250266347; 
 Sat, 15 Jan 2022 04:37:46 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-9533-0c51-a891-732b.res6.spectrum.com.
 [2603:6081:7b01:cbda:9533:c51:a891:732b])
 by smtp.gmail.com with ESMTPSA id q27sm4985366qki.100.2022.01.15.04.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 04:37:45 -0800 (PST)
Date: Sat, 15 Jan 2022 07:37:44 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20220115123744.GX9207@bill-the-cat>
References: <20211130153342.1.I72cfa7337b8feb65ef2354983f4acd710ce57232@changeid>
MIME-Version: 1.0
In-Reply-To: <20211130153342.1.I72cfa7337b8feb65ef2354983f4acd710ce57232@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH] test: test_lsblk: Mark as sandbox specific
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
Content-Type: multipart/mixed; boundary="===============3228299263832720078=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3228299263832720078==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/x1fcI38Qzc3pqTp"
Content-Disposition: inline


--/x1fcI38Qzc3pqTp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 30, 2021 at 03:33:53PM +0100, Patrick Delaunay wrote:

> This test checks for output specific to the sandbox blk device
> "sandbox_host_blk", mark it as sandbox specific.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--/x1fcI38Qzc3pqTp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmHiwBgACgkQFHw5/5Y0
tywWgAwAoSUn8jY6+KWG0NJ3vJubONdHv4To4z6+l+Fse44QyaAA8rMV6/4ghDWQ
5VJpD+uVNcpcl4jdMU2Kg8S9dYGK+n/iFRwKFae+V8HXAuhvnaxsV3Ju2Hj5x7rC
yUwF1b4u211++9ltxsfIDEuHSRamA8WYz2XhgxaxicoeS8B04tAnuIc9mTWmX5fj
h+9Z7YzUFCWJAd3lcpgi+Yd5U6Y15qytVFwk5ylAoZet6eYTUAQrpbvwH/CkHvi9
ycqfKprYuD4n+eON5WgnQhVD1Oa8pzdojS7lK9ypheNQve+vKVuEqggTTJYduI6v
7h92bQtNu425uk5eCfIGm8TL51FZKUfiK49d15p6CeQ52znUz5VuaKbVd3zjkac1
h2ajc/nJp97n9sGKWwh8HjxAh2i36Tlc5Boh40JLr1s7boXs4gltbfUH/jiEXgWA
XVP7Qt4wti7cvH940M8pmjkcTCb826AI0LSbf1k/zdkQML0+b0byY5gmaD2gbu4h
ftx/gmqz
=i/Gr
-----END PGP SIGNATURE-----

--/x1fcI38Qzc3pqTp--

--===============3228299263832720078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3228299263832720078==--
