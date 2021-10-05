Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5BE423325
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Oct 2021 00:02:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 142DCC5AB80;
	Tue,  5 Oct 2021 22:02:32 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 089D8C5AB7C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Oct 2021 22:02:30 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id a20so615138qtp.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Oct 2021 15:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ydJNeNUEWGXVJlCQLlOjdK3Z2tDO6gNsdbaAccD/hFw=;
 b=RXPt0lwkk1PiKpIq0uN14yO+C9K0YN8yqN5ekYqEc6i71hD3LxPsHGFVz1fOrQ/Gb4
 LOEw6pbQRMsZcxcygg3sOuffWksJtbvkvG8L9i6JNoe5zh3cKAUHQnR/PnNlLUEKH98v
 sYSHcQOxBRBgqm63LabgpCR466jImjmYnEWSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ydJNeNUEWGXVJlCQLlOjdK3Z2tDO6gNsdbaAccD/hFw=;
 b=r2+tRLsLAQd+TL3A6wPONBXY4lwz4/C8z7gdobNMMcxSO6Rmgy3WNZ+5q5xu2Xgklt
 bjZ8JXKWyzSSnI6EkoxJTtCZgXyXb04yWFsF01db3ArA9M9qmzKavlnBgA8C95D9MTvr
 E4dxGFvTSGTuYj1D9D0SbiS3kV0ImYOrGt3/ObceEMmoR8gOI5JAaIevVqI0voR8Hjtq
 5wjwa7TqIhDwnMWNMi6/0Zy2a842ryZmtu3JLEZrSgfKuCT2fPs8vtx+tYIEJQmuJyKw
 SlNJxIMGky416IgFxOp3oOe0nkKu4LADKjjZbBCO4PH6yeFkSsdo0N+Iq2iPnhIFOl8u
 tQsQ==
X-Gm-Message-State: AOAM531XXmbj070QbOFGLvZijQvX+Fdp2+HgN/n8SlPd40CYqwzjeEBN
 iS6cn6wQ/mXXfGchdDXzXkR5qg==
X-Google-Smtp-Source: ABdhPJwx6XwNwes4ivqrGAdmaiPcDvbWPL8REFobT7YK1G7a4IqN7P+OwGnFxWiZCBa9N6HqYuhxRw==
X-Received: by 2002:ac8:5884:: with SMTP id t4mr22831455qta.174.1633471348207; 
 Tue, 05 Oct 2021 15:02:28 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-acff-2c31-c6db-812f.res6.spectrum.com.
 [2603:6081:7b01:cbda:acff:2c31:c6db:812f])
 by smtp.gmail.com with ESMTPSA id x79sm10328436qkb.65.2021.10.05.15.02.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 05 Oct 2021 15:02:27 -0700 (PDT)
Date: Tue, 5 Oct 2021 18:02:25 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20211005220225.GK31748@bill-the-cat>
References: <20210920175547.1.I72392b8ba601c9d559c976adcbfb03bd5b559833@changeid>
MIME-Version: 1.0
In-Reply-To: <20210920175547.1.I72392b8ba601c9d559c976adcbfb03bd5b559833@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [Uboot-stm32] [PATCH] remoteproc: migrate uclass to livetree
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
Content-Type: multipart/mixed; boundary="===============5860195569287075401=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5860195569287075401==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cyo35BrQQcDYYKAP"
Content-Disposition: inline


--cyo35BrQQcDYYKAP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2021 at 05:56:06PM +0200, Patrick Delaunay wrote:

> Use dev_ function to read the name and boolean to support a live tree.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--cyo35BrQQcDYYKAP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFcy3EACgkQFHw5/5Y0
tywfZgv/cZBICsaFP1h5NisSY8gNtyIHOSjs/K8w7NQ+3C3e690dcpT/CBt7Dc+x
mbTa+rYoPBps0MNgtHVyg5ZqIC5FB8pPVN6yF2TgBaL1TuRGL5yqdkP27IrNJ8Zr
OJ2CENfy9P96yQ1cKm9n3IsUSAEY3gLHD4vaXRANYtSHC2Bs60VXisg1R2JpKKeH
OeB3BQpvQ3VjdtesbOcH/VeUGW00erNwc8vHyNhGkw9lh9xyMdEzDO670fXVkEd/
VCW6Vn/hPJVRaT6G/vi8Ivv1TzDR6iaHNtQkR4rGssn2DoSX+gcUHvi3PGqrS1Ga
6tMiLKMKfSQu2k149Sjf/k41UvGkZLeMELEqb/F6ZD/YyAc18GQA4HEvkGuN2Ot6
N+1MT5Xt9whDwpybV1ZwTxVgJiNPFE1VRA/xio7sywIT32YRhTmib7SewmhBByWk
Bw1yv9grRlQ0Vn8LwdPWPGEQDTiY/bOGO/aTeJZmaD3V+cZeLoRfQVyWK5H4qDzK
vqQDohIf
=uDbX
-----END PGP SIGNATURE-----

--cyo35BrQQcDYYKAP--

--===============5860195569287075401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5860195569287075401==--
