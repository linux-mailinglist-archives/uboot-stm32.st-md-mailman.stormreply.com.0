Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E48C11AE736
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 23:07:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0C25C36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 21:07:44 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00660C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 21:07:43 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id c63so4024961qke.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 14:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6e57h23Pa1U8d2VXfo7543RVyj9VlKx+zWD2qpTJ68E=;
 b=GW6TFU4pmmNHUQ86VYo+dKToKTkOovkn1RI6GFDRsDTBb7FUUuNZxehT4yNrdIO6jJ
 GEw0ZV37MoDRCIShxHBbyhxXi5Ui9Vu3YAWv4bNvImGbfc0VIf/bP3WAwY1+hgJLMbQw
 6rvwzGWBIolnzg00mptTBz7NRFCWDMK7SP/OI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6e57h23Pa1U8d2VXfo7543RVyj9VlKx+zWD2qpTJ68E=;
 b=km0Vp0bkdyMe/xwEYqvSzS7pHLBf1NvyCYuf4s1PXrvUaizB9yIcE8n2lcqpCryRWf
 X0gS6qitnuirGKfIAmFO3EdWloM13faTJzjQX1D8VJeiIk4korchFoX7iefsgANZB5ZG
 tQpKX/A5icLWHJRqzYSn62cm5NwNMS2OUTod8tXI890GrwITKO4uUFmPbC5N8sNulsy8
 ioZ5RcpiPoSgoB5tDHSUcHKk47t+oNCpTuk39EGic2Wj7WDl7cxYem4Mq/CnF+4CbojW
 a3b8MfQZ68Fp1Zs6jjJ59O/1axv50zf22qmQoQpzH4lmYFvSm5Co6Zr+Y/geyvQZR96D
 te9w==
X-Gm-Message-State: AGi0PuZ8u9tWAxgWrI8GkKnNZELAgBVDdMnqhAvxczC+sQHY/9LOM7/P
 fjWaD12bctR6w5Ga11tz22O5Vg==
X-Google-Smtp-Source: APiQypIG2z82yk+xSKkS4jDGXtJxuMA3wLEqCcI+BLdnR5ZGntBuvAUykpg9BU18R1r1VcKk3d8lXw==
X-Received: by 2002:a37:5004:: with SMTP id e4mr5335701qkb.18.1587157660531;
 Fri, 17 Apr 2020 14:07:40 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-4058-2b78-ede2-0695.inf6.spectrum.com.
 [2606:a000:1401:826f:4058:2b78:ede2:695])
 by smtp.gmail.com with ESMTPSA id m1sm19183323qtm.22.2020.04.17.14.07.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Apr 2020 14:07:39 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:07:37 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200417210737.GA4555@bill-the-cat>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-21-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200113103515.20879-21-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 20/21] test: dm: update test for pins
 configuration in gpio
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
Content-Type: multipart/mixed; boundary="===============8386234587502074932=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8386234587502074932==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JEhTuUFIcUlI65CC"
Content-Disposition: inline


--JEhTuUFIcUlI65CC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 11:35:14AM +0100, Patrick Delaunay wrote:

> Add tests for new API set_dir_flags and set_dir_flags and associated
> code in gpio uclass.
>=20
> Test support for new flags GPIO_OPEN_DRAIN, GPIO_OPEN_SOURCE
> GPIO_PULL_UP and GPIO_PULL_DOWN.
>=20
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--JEhTuUFIcUlI65CC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6aGpkACgkQFHw5/5Y0
tyzhjwwAloQuis/H+dVV+JttLqkuBk+mlDEi3tRBn9zy33q78BQ1++Yl+cHd2gXg
pjaBllNcZw91JAjsQpeDnMVtDdTK2g322vaWLNvI4NK+7dy3ApxUe58QbaBIuc4z
ZoVPzRBajZnnmxRj/ka8zYyze2GnMUuHJxXARHb42a9Va9HkZ6mzNnKWZpa6ql1x
qnqsTH5USIua7X2B9wxk4wO88Pp7Wj8BAsfEeaCO33MSQymUqf2JyBXkWkoyA2DG
Z+gC4kpAX357VUnkOV0SdIbOkLRLPB3zKObucOD/gJq+CvryEkdM3ZL4f40mDIys
lWWO3aYhkG+Pt+k9hUL2AydYOlSQXP4X9unwLNG/cXmnGWNWJCi4yG5+Ghq9emYk
LQEbfOFKi/kwK6yjff8oy8LlKhIhqqg9lUAbakQAiAjkqP5oMUijF/SOOK0tdI3U
UxfkvLw0DZpHX5DEvFCAomgp7DNkYXBkjdtyUZkLErIkyxpD69EFVdsvZSZ6oor1
FUotHxob
=HJ4M
-----END PGP SIGNATURE-----

--JEhTuUFIcUlI65CC--

--===============8386234587502074932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8386234587502074932==--
