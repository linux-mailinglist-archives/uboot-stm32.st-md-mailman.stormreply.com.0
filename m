Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B3758CE51
	for <lists+uboot-stm32@lfdr.de>; Mon,  8 Aug 2022 21:08:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 003FEC04001;
	Mon,  8 Aug 2022 19:08:21 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5400C04000
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Aug 2022 19:08:20 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id m7so7176844qkk.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Aug 2022 12:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=5DxGvbpplRTJtdJgNnGIY75boqIvIBStawmsZtVpzcg=;
 b=EgzFF2CxIYUKB3MoC+Y2NAOLA7aceQf4LTC7KxyfMe8emmaOVK9qTxlnQRIpWYVyqk
 VUxTJoDUoFmvOD9Bn+VxIEfj4rAaJVOX2KtG1TAVAP3/894roMEciIOXTI7z8SkZ2IOw
 g0mtJT345jKqsMBQ0gb9uyHGugqbKBma5kJGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=5DxGvbpplRTJtdJgNnGIY75boqIvIBStawmsZtVpzcg=;
 b=NEVV0TGV/8Wk3ItU8haZyiJ9zuimW9CQ/TNJ5MG0iZpieUkEmxLczOsrEpoLgJmmPh
 3c2xaJ9oldIBs3sUYT3xhFd1jtXNHTnUQmWrKY/02TvYoKuWXk32qXdyHqCV6WRJtUCU
 NNjUONnfkx1MZWc10ZqpmV7eBWf6taT7t89nEwgF4sDFImH4VOJ3JaY/Cf73duv/RGE+
 RJF7b3syJBk+OEjSmiA7gTqCZV8oXOoGKazA/kiro/Z9B4A7Cb2FEm6CQah7jWblmtSm
 VWILpqAMabkcjbunyxtaebTlqJFOG4mgLjB5Cnk6os7yihOsUoQxVUje+tsj+d+CSkTx
 FThA==
X-Gm-Message-State: ACgBeo0u/Rjl3lIUW+k+lme2k4kru62UI243s3t3VcsNQfMTXoHHbbEu
 Pk+ITYIqU1g/fmWbOzvyo9POVw==
X-Google-Smtp-Source: AA6agR6d8eX7KAG38f5QnwdAkKp6v+7HvcqidYaDHf6dfok1+bT7Oailr+zMOJ2Z/LeHUlvFJlxvgQ==
X-Received: by 2002:a05:620a:4593:b0:6b8:fd92:b2f7 with SMTP id
 bp19-20020a05620a459300b006b8fd92b2f7mr14680504qkb.198.1659985699824; 
 Mon, 08 Aug 2022 12:08:19 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-195-139.ec.res.rr.com.
 [65.184.195.139]) by smtp.gmail.com with ESMTPSA id
 de19-20020a05620a371300b006b5e60c4de1sm9474361qkb.78.2022.08.08.12.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 12:08:19 -0700 (PDT)
Date: Mon, 8 Aug 2022 15:08:17 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20220808190817.GN1146598@bill-the-cat>
References: <20220630110938.1.Iada23492743e3af977e07c1f1b8c2f32550436f7@changeid>
 <20220630110938.2.I32a23c3e933a9c38ac1407db2b5c7d54e01d58b1@changeid>
MIME-Version: 1.0
In-Reply-To: <20220630110938.2.I32a23c3e933a9c38ac1407db2b5c7d54e01d58b1@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Ramon Fried <rfried.dev@gmail.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] net: dwc_eth_qos: cosmetic: reorder
	include files
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
Content-Type: multipart/mixed; boundary="===============3447072183461484539=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3447072183461484539==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b1A4R4OXgdMr1VbW"
Content-Disposition: inline


--b1A4R4OXgdMr1VbW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 30, 2022 at 11:09:41AM +0200, Patrick Delaunay wrote:

> Reorder include files in the U-Boot expected order.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Ramon Fried <rfried.dev@gmail.com>

Applied to u-boot/master, thanks!

--=20
Tom

--b1A4R4OXgdMr1VbW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmLxXyEACgkQFHw5/5Y0
tywYUgv/VGHegDlCR7hxMuBy60axXtmCf8SrMXPpLulCVt1KQ3VOOjpVLXReI5Xu
0OBPbtLQEGs6XY9VIrqCjgum7tLsEFlSmHL+/NHYmldGclrUmEB7bg6lZzlwqL5J
2rMJ1JKQTLgiQBEijJ1nHwF1ZoXfGKEtteEEUVnVWJQfiqYzFWYdydqOawtnsrKz
MaSIR1Z44I2foCym/DWsPmumb+9a73n0VKTNjLX4osCborbt7g1S4zjRR94OVQYQ
szG0etqXa5F22/2M2XOGd43qBVtvpKrg/RNeQbbpkF7KkmsFYF+xHmuQKcsLBjHW
webA6NFaDuCIVDiGP3tTcQWBCb0BcX8dNdf6mVwthuqBr4gVUf1aPCf4iRXUoA9L
kpW9Je1P+bTR76SFAwtjIB21AtQnU+KR5PfbGwEWnWqsZBZlMvEY84chTSGDqHyo
/de+Kt1bahNCFqtg6IWHR/iYWE1gqwKwF1onUCekl0u0+pB/jmpTDuTlQQpw829X
xsZsYmid
=x7J9
-----END PGP SIGNATURE-----

--b1A4R4OXgdMr1VbW--

--===============3447072183461484539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3447072183461484539==--
