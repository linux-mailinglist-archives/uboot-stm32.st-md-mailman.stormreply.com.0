Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3C722F1C5
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Jul 2020 16:36:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA537C36B25
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Jul 2020 14:36:03 +0000 (UTC)
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
 [209.85.219.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3BD7C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jul 2020 14:36:01 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id s15so3102524qvv.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jul 2020 07:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yn2VV5/Tn9Wfd73bEURB/GH/oDzISDyMHZkGOLIy+zI=;
 b=MEvT3Gry0yGYFc1/FZW5RzQSEhEFeTS6vO5XiWynWYleoQ+K0mNNndIEipBgZvFgJR
 2FPcQjYWADZUKk3q3OZqXIS0hNPpVEGTChQHgtAhSPT35rSwnTSr1yea6mzV6D8id49+
 CjyXnrMicthJIE/akGZIWqipI8zlWvh/H8JRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yn2VV5/Tn9Wfd73bEURB/GH/oDzISDyMHZkGOLIy+zI=;
 b=AYWwWRHCnCWFWs7baeBDNjjctoDJLkZdeXscWfdX66RcYiPH/pH57+YRVF9Y4ln83C
 y58EAIIV0Az8+fOdc8HlR7qsZ249MYGvX5UaKAKi0B5dmrX0ESKnR/tLblc6UQ5AJPBS
 41Z0T5Of8nfOCCCd/dnnkmeJr7fZ2BQPpscAlWiGkJoqlHCfycq8kU3ietoOuBUvmW/V
 CU/ZKcxx1s6J2WjCyYK2NGOLDQntTb1zdMHYy2Tjm4607d2i5GMc6vGuIj0wAkp2Nz9e
 z0iGSGFKtcFmy9a5lA0vRMeOVKkooU3WABnbwGTrizBYk7NDi627xgilJtdzEnVODgNp
 39mw==
X-Gm-Message-State: AOAM532y8dxcvELIKiRai0qL9KXSjFX281veH5uv3EgoaCpI1hOAR/Iu
 9XAn5xjB2IHvkZAeieW3fZit8Q==
X-Google-Smtp-Source: ABdhPJx0XGE3bjoAD9/9z7IAizwV5V6IiMuAQP+aqwqAI2Gs0GsN9fRKeAB8DKljMrXh52x0VMg1Lg==
X-Received: by 2002:a0c:c781:: with SMTP id k1mr6426586qvj.223.1595860560789; 
 Mon, 27 Jul 2020 07:36:00 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c61-f1b9-a518-346f-c376.inf6.spectrum.com.
 [2606:a000:1401:8c61:f1b9:a518:346f:c376])
 by smtp.gmail.com with ESMTPSA id x24sm14889929qtj.8.2020.07.27.07.35.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 27 Jul 2020 07:36:00 -0700 (PDT)
Date: Mon, 27 Jul 2020 10:35:57 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrice CHOTARD <patrice.chotard@st.com>
Message-ID: <20200727143557.GR6965@bill-the-cat>
References: <20200430100619.28557-1-patrice.chotard@st.com>
 <20200430100619.28557-2-patrice.chotard@st.com>
 <20200707200859.GA10034@bill-the-cat>
 <4e6a38f6-0de4-59f6-caed-ac8c15035726@st.com>
MIME-Version: 1.0
In-Reply-To: <4e6a38f6-0de4-59f6-caed-ac8c15035726@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Simon Glass <sjg@chromium.org>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [Uboot-stm32] [PATCH v4 1/5] cmd: bind: allow to bind driver
	with driver data
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
Content-Type: multipart/mixed; boundary="===============1206032333708386319=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1206032333708386319==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LpcCHpaCAbC4X43d"
Content-Disposition: inline


--LpcCHpaCAbC4X43d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2020 at 02:25:06PM +0000, Patrice CHOTARD wrote:

> Hi Tom
>=20
> Sorry for the delay, i was on vacation.
>=20
> I launched dm unit tests on current master (ada61f1ee2a4eaa1b29d699b5ba94=
0483171df8a)
>=20
> and everything seems ok, perhaps i don't execute them correctly, see my l=
og below :
>=20
> ./test/py/test.py --bd sandbox --build -k ut_dm -v
>=20

Hunh, alright.  The series isn't applying cleanly for me either, so can
you please rebase and repost?  It seems I must have messed something up
in the rebase.  Thanks!

--=20
Tom

--LpcCHpaCAbC4X43d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8e5koACgkQFHw5/5Y0
tyz9MAv+IOlpuHOsPK85tc9hSmkWFhM8R5TptSqznRyBWReFp2rTgKbu51OfXGV+
9pDCrUVdI8Nb/WYMt0b9zINWGopmPn7Yb3juXLQeQ9Bf7PSahBejGd1eqFXaglXs
gjjyI2vm+YHK2lOK0UWc8TDtK9IsAPnjUOn2T0OylpEYuRvzpxnreNsg0ojmKlN9
znjx/zTvya003ouG16LY3+pAG/CfU1Ub1x4biChlP4WBjInWI4kRd6OGtFdj4VhC
K5Bu5FPosHGZPTvg96SQZvKjXU0yjY4H48YHyH4edVnCfhToOrt/p+O3FFguMuvK
EQbDHeJobFr5BCfPce3tQ/mrARANwZpYzFJMN3fW4sUgyO7mPj7SWKuE8kxmNKLX
ilV8XLtNtt2yxVPX0KA2v+mQAvKtfHtcbwvCwIMdOnTDI1n8aPJDKZshcPgi/nIa
+/omsB50UePuPpimx8FXRQYlnzDALryuzlNo1E6rhyLdHtU5SYKatZMvXk+vw/1n
9C6rSDUR
=fpGU
-----END PGP SIGNATURE-----

--LpcCHpaCAbC4X43d--

--===============1206032333708386319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1206032333708386319==--
