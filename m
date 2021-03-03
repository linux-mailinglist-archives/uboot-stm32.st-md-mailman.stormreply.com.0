Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCAF32BA1D
	for <lists+uboot-stm32@lfdr.de>; Wed,  3 Mar 2021 20:09:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA081C57B62;
	Wed,  3 Mar 2021 19:09:10 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA26BC57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 19:09:08 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id b19so1611983qto.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Mar 2021 11:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ouPui0eFwOltN3RaL0tecHGry1483qE17hWQF85zYcA=;
 b=LFfDyHAROHoVm60RNiDMGD4imtTt8eVUCbCic9Vw6L5VMi1ZcI0PX6OoIDkFON1xQz
 NANx/BYZzhn4bB3K6w0/NRBN4CBA7nYQ+SjOnCC75bwr98zdU1vevaEozYV4mm2q+Cih
 vx72o+ZL0giggriDphfaGTb//wK4SOVuP12L0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ouPui0eFwOltN3RaL0tecHGry1483qE17hWQF85zYcA=;
 b=bbbjUkOqCv/LsnQCFJ0OpMSISmt4UAzI2hzrwZErWmGvuBuodSRP03O218Mvf3GP3f
 P65f7bidYgbB0QCEvHrIG7xeIofC9nP+NxQcjR7FKHBuzrDb+0nUVWuwoTsRIQsy+Ohi
 wbzVp4ciJwql+X3Xqsq+L6E0ZEA+iArTXpk/LPNObyvK9pks1RBSTGIy7g8C4E3KcsdO
 tApTWfIbodKtZklHFsAARs+QdINAF2YRsiGY0HBRwqAlKldGgiFN2yIFRChdVMJvVnxH
 qSd/XCIHsNZdlT6KeiWoapOTdSR1/D55tYVglNCPlTq72A+NhZrmeUUzU+BgrQAXvymM
 +HTg==
X-Gm-Message-State: AOAM530TUAZeA9cmtlN3l5tK3WI4K91zANRHRqy3We2Bx6C7SKd4JLvI
 AnDW9pvz8sYxyJJo9WCz2kFung==
X-Google-Smtp-Source: ABdhPJwqaePeDdgGQg8FZ9e8/oWTJYvdKFy9hcstX3tsgQtHz65Z9AU+noPtWcCNJWDK4T3l2kP3oA==
X-Received: by 2002:ac8:1116:: with SMTP id c22mr695308qtj.230.1614798547233; 
 Wed, 03 Mar 2021 11:09:07 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b07-927a-451a-3a99-8647-33ef.res6.spectrum.com.
 [2603:6081:7b07:927a:451a:3a99:8647:33ef])
 by smtp.gmail.com with ESMTPSA id a14sm14507598qkc.47.2021.03.03.11.09.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 03 Mar 2021 11:09:06 -0800 (PST)
Date: Wed, 3 Mar 2021 14:09:04 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210303190904.GQ1310@bill-the-cat>
References: <20210205125339.24721-1-patrick.delaunay@foss.st.com>
 <20210205135332.4.Ic523a7db6fe8e4ee710cf77f0986c73bdb21b103@changeid>
MIME-Version: 1.0
In-Reply-To: <20210205135332.4.Ic523a7db6fe8e4ee710cf77f0986c73bdb21b103@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 u-boot@lists.denx.de, Ovidiu Panait <ovidiu.panait@windriver.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ard Biesheuvel <ardb@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [Uboot-stm32] [PATCH 4/8] arm: cosmetic: align TTB_SECT define
	value
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
Content-Type: multipart/mixed; boundary="===============8214200642833272824=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8214200642833272824==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zywvytGCXzdVpkje"
Content-Disposition: inline


--zywvytGCXzdVpkje
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 05, 2021 at 01:53:35PM +0100, Patrick Delaunay wrote:

> Align TTB_SECT define value with previous value.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/next, thanks!

--=20
Tom

--zywvytGCXzdVpkje
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmA/3tAACgkQFHw5/5Y0
tyxGLgv/aFCyLxL/7rKr3ydPmco5nnCnaLObzPE1qyNT7Q6eMWr+6b3WsYiiZEJW
g10u7Qdtya1T39NJRycYOvBnPANoIKR1Q1o3SM4c5/DFikEMh1Qk1Nbo8CUDPgD/
+azx0KclopaBsKMm/gwfPTKT0AZhgdV13YzgTlN1nH1RMTdaZs2MOf70fNI8p34X
Ml7t6zOQlSCNiDzwk6dblptmcLcsR0iAGZpYMrwQ5DSOKfDx+H+CTEFu9q4+mEwS
Tt9jC8Ew4bxvQ2TF1/xXZym3CvX+tfu+PfUqusTzeImPqLH+HPlLGdcrRyv/04OM
OVKM+TCIOWvub37fvXFgYeBx3ASZM4JmbRV5CsU7ekwNB239XAtBKSBKRl6rfqi5
spMcFmZG59sVaJ/XCG9eyDWBhW5P7YhffBcPXz30LMmOhRK3Ed+ic88NfrAO9Zbj
hV1WdktFFuY0/QsEfjpm+BGC1ad+BltyA3B8EgQVy0vN31uAOuNQU2TDr26wRA+V
W0FaJZq0
=4dzI
-----END PGP SIGNATURE-----

--zywvytGCXzdVpkje--

--===============8214200642833272824==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8214200642833272824==--
