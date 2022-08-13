Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5A359183B
	for <lists+uboot-stm32@lfdr.de>; Sat, 13 Aug 2022 03:41:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6688AC04004;
	Sat, 13 Aug 2022 01:41:46 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAB1AC03FC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Aug 2022 01:41:44 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id d1so1851597qvs.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Aug 2022 18:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=JNaHFunjZ+uNB5JpI5FkKCwJcDCv52Jd+msZDTxzkKs=;
 b=Lkhl+6MpJMiPxYprkhNySVHMHsqRc2vyrLlpf8Hz++MYiwBnMjhUxfKR8Ur+dx9nc/
 f/qSjyvtjbVsMtbZlRlKMngwCm27WYPrleuoQKi89D/sZBf0onQOhdnsdYh+hUkLCtjC
 CT5FdXfkg5NNSpeuUeGV3gAl/tD5ImAKYmcV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=JNaHFunjZ+uNB5JpI5FkKCwJcDCv52Jd+msZDTxzkKs=;
 b=dMRweHY/o5t6gOzukdP/WmYc/Cx34hM2UX0/aekQxuStuEMex5K5z8rUL1xATLsFku
 1oAzoxgvQ6cG5Hlmfr1aKxiqywHImoDiF5M5C9rIp6KESBVPQpdJdXEIP01qF6oepGrZ
 fW3+g5E8PQ0BESVEAGYQq2E2nxQVdRR3wdtZ1o4ulhhcgNZTLXlb6jym0g1EXQaDGaW2
 6HXY5foz9dzFYsb0EAcm9aHC/U9N2CT1JgLKgeNjggdt4I+W7ZukpzT3nJ9HOAYmaUED
 N85gQq1/qULf5Gfc8EBK1fES3yWUlif0Uun6qoVDF9VwLZOLWkqefVdI4Qq5ljYIRqrq
 vzEQ==
X-Gm-Message-State: ACgBeo26A+Ia2dXw1RWoTrYr2l5QFTyUYva8XhD/bXtrwafND6Qj7H3z
 J2HO3b6JQFHqtBlbcxD7LacAmQ==
X-Google-Smtp-Source: AA6agR60dTt0aBZwXLzeYVc97gg8cMIs/bX3TPCEe7uZcCMnsFpluoMdgt7E3YLCEF14ApkwFd+oQg==
X-Received: by 2002:a05:6214:2345:b0:473:a82c:34eb with SMTP id
 hu5-20020a056214234500b00473a82c34ebmr5782491qvb.9.1660354903847; 
 Fri, 12 Aug 2022 18:41:43 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-195-139.ec.res.rr.com.
 [65.184.195.139]) by smtp.gmail.com with ESMTPSA id
 r2-20020a05620a298200b006b555509398sm2830870qkp.136.2022.08.12.18.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 18:41:43 -0700 (PDT)
Date: Fri, 12 Aug 2022 21:41:40 -0400
From: Tom Rini <trini@konsulko.com>
To: Philip Oberfichtner <pro@denx.de>
Message-ID: <20220813014140.GK1146598@bill-the-cat>
References: <20220726130454.2829205-1-pro@denx.de>
 <20220726130454.2829205-5-pro@denx.de>
MIME-Version: 1.0
In-Reply-To: <20220726130454.2829205-5-pro@denx.de>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Marek Vasut <marex@denx.de>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>, peng.fan@nxp.com,
 festevam@denx.de, u-boot@dh-electronics.com, Simon Glass <sjg@chromium.org>,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, sbabic@denx.de
Subject: Re: [Uboot-stm32] [PATCH v4 4/4] ARM: stm32: DH: Use common MAC
	address functions
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
Content-Type: multipart/mixed; boundary="===============0285593700235556780=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0285593700235556780==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i6PHWhsiXSwjYqSc"
Content-Disposition: inline


--i6PHWhsiXSwjYqSc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 26, 2022 at 03:04:53PM +0200, Philip Oberfichtner wrote:

> To reduce code duplication, let the stm32 based DH boards use the common
> code for setting up their MAC addresses.
>=20
> Signed-off-by: Philip Oberfichtner <pro@denx.de>
> Tested-by: Marek Vasut <marex@denx.de>
> Reviewed-by: Marek Vasut <marex@denx.de>
> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--i6PHWhsiXSwjYqSc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmL3AVQACgkQFHw5/5Y0
tyxxEgv/RcFIEpzlkIeD7b7esfOfv2HC3g0t46jdzaIrO3ehHLLsbgkcqx0a2XT9
96pN654bbhWwKYF6wVA7j8Xp9JvUO2OG7e27Cjj4yvYtbNqcWML/Z7p2YQtCvtO8
5Ug5/y2mjDKYzhIALrWTcrwm6635asQH2vXHmZGBVf2tC+C/jn7+YSMh5iJSBIiy
H5I1qa1fP4GpxhIj6ZHATw7ANlBaBYJaBR7izjwEn4TnEa1PTw7XAByFRbwrg1sp
3uLmKpeDJBAsFt9v37or81d03jlcXSH/kbq8pHC4y87eywzpzZVn/HrnG/yOwmX9
4jkN7wCWVHJzJlFALGCsfFbcpH4VUGdRceCx6yWr4C//ycQriYrQ153WPq1kZI/f
cBgI4gQBE2vMnjWMMSt5bzi7gXMHo6LSrMqH9gWduanfOtB/IfrNuMxreeuPDrLW
z9SMuSBbApScRqKOGBP6OkfTgSpDGKBE7zRD7FgOAcGevU/lzbXTF3ZnithX5rDv
mshssbLq
=FWsD
-----END PGP SIGNATURE-----

--i6PHWhsiXSwjYqSc--

--===============0285593700235556780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0285593700235556780==--
