Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F83E22ED5C
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Jul 2020 15:33:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12BDAC36B25
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Jul 2020 13:33:00 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22BBAC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jul 2020 13:32:58 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id b25so12152408qto.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jul 2020 06:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QDP1JJFVGAhpqlPK7Jb71npigqKpHlOmu2PP9FPMUK4=;
 b=fSYS2VIHoYpW3spF22iQlu4bqrC5o8eHHIoaW0fKvrw7dkj3KL7nzlhT/vxyPJTs9d
 Hd5V1LPLGQ4IZk+uUTumqflohx67HV797zmOmLZ9XfPLKcFWnrNY2+eeXAYfsEaMK8Z7
 CXTbKTtfBvGur3Qww8Nq7pHgInu9YBBPGekps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QDP1JJFVGAhpqlPK7Jb71npigqKpHlOmu2PP9FPMUK4=;
 b=LPcdS9ERZwGvRtS08RLBJ+T0Cpr6isHv/YRVIq6JI+zkwoKYB4/Bfh1s26v26Zi/jn
 bvObadY4aS2sBV0XgK9XNgifJsyPgLFjrisv0FvS5j5FracgVfNwmL/0GGs1UePcWGjj
 l72twtYcup/ZBS8sbQMgdGfBKnt0zkkyziqZiBgtVGkmSxisQHpkVxEFLtyPng8D4b/j
 c8y9TC34mH3+eYKtkrvqzMzef6EvSPfZN42mt4RjsypW2+Zk74OnJcwoK3fAGbuYUygh
 2KD+KtfYc2W5PFQRUCEm3ZnS9uq/Q0kZZn4GT3trkCtNVr3PobcP7S+zOZgukEUhYM72
 rJPg==
X-Gm-Message-State: AOAM5327qs9a9+kftt7Hku3zsCKActq6qkfSdRzfgsyfh+vfP8YW7jrp
 zhsWUxRgxnUuPepg/9vsRrPQyg==
X-Google-Smtp-Source: ABdhPJwcParafROGDre2ID1U/ORTsIAjQDSBRQFdPZoudMSrT+eGOYDEIszUt2N6KgldIpUKOifmjQ==
X-Received: by 2002:ac8:7959:: with SMTP id r25mr21019979qtt.85.1595856777699; 
 Mon, 27 Jul 2020 06:32:57 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c61-f1b9-a518-346f-c376.inf6.spectrum.com.
 [2606:a000:1401:8c61:f1b9:a518:346f:c376])
 by smtp.gmail.com with ESMTPSA id y3sm9879431qtj.55.2020.07.27.06.32.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 27 Jul 2020 06:32:56 -0700 (PDT)
Date: Mon, 27 Jul 2020 09:32:54 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200727133254.GE6965@bill-the-cat>
References: <20200624072726.24386-1-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200624072726.24386-1-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Wolfgang Denk <wd@denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH] env: correct overflow check of
	env_has_init size
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
Content-Type: multipart/mixed; boundary="===============8276917316072135683=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8276917316072135683==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="osDK9TLjxFScVI/L"
Content-Disposition: inline


--osDK9TLjxFScVI/L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2020 at 09:27:25AM +0200, Patrick Delaunay wrote:

> Correct the overflow check of the bit-field env_has_init with
> the max value of env_location=3D ENVL_COUNT and no more with the
> size of env_locations.
>=20
> This bit-field is indexed by this enumerate and not by the position in
> the env_locations (only used in env_get_location) and the
> 2 values are different, depending of thea ctivated CONFIG_ENV_IS_ options.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--osDK9TLjxFScVI/L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8e14YACgkQFHw5/5Y0
tyw17Qv/Q06NfxP8mH+RfQMsbmysxVv7dSGtljvAVLHqmf6XOnTUS/Dvxk7gNiho
2JsxEQlTQtMHGF1xxwktBMuwWtKh8GLqsy3tmdbGm9C4G88RZ5KVJWjFn8mqdlZO
OCd18kNM2/YcJ954mXZ+6ssyCeR794ZOTSlqoIofdoiOzCrskmE5p6YJ++0teeDS
iUOSxXAMAWSKm3ZDvwHfmCrBLMdTdUGL3tBDnxrXSRs0DPS7W5p4r7aNN2wTJjHQ
wP9oe0rcLaYNftIikLuGnu81vQDslGNuWPXnR5/iIvibK7VF/fAji8INczIC9vNI
oGiPNd9IuW4DY8CHCS7vIze2BRbNVvTbZILagZJs/ScseDkiQjxBizGZDJlMmITC
RiqpAuJwjkKCQmvAipND+PmOQzoSmWYOmSrRFlV/VIYAuQA0H747qkhYQMGKF7Ou
GdTapG1CBmWSGBhSigwC7z9zsEXFBldAAz8LtEU0Jxf9NRqPwOQYMMh40qDMzLIv
IB3R0naM
=RsOq
-----END PGP SIGNATURE-----

--osDK9TLjxFScVI/L--

--===============8276917316072135683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8276917316072135683==--
