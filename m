Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB31E1AE733
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 23:07:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 284CAC36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 21:07:28 +0000 (UTC)
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
 [209.85.219.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A34B7C36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 21:07:25 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id di6so1627067qvb.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 14:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9+SRi5CBAzl580dbhTYe1XaZTgIZKzKgkE2eESQTgxc=;
 b=Y1NEnZ6Zj3Pd1U7BVgfjr5CTpAXvE3NOy2bj5sjCTVMuLInBsxTXBQeXjQ0KCb1JZw
 Too6efvlprnnIpYPY7Dau3dN2SCCPnw9VKk8Jb3Iic0qsIlCx97XkzZRT1Wtpmy2ewOo
 9Nqc2EsjjJBNCjSqff8pJAVcDXLMp02VnEC1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9+SRi5CBAzl580dbhTYe1XaZTgIZKzKgkE2eESQTgxc=;
 b=AVUZ40OKUw/Je1WCruLcuTg7jrtHNJIqllXBPP+SZknNOrolHmu/g2oD83KON9jmNm
 0yEZ/Fj79CfW+9VUaN8kmXX2WkVRWqQI3piP7TgStGqgNKJ02kFa2hpQ4mpOvTtBISq5
 Z72npjYcfGBhRyCfGhEH62uqmkwfe5n0TogoGMOnM/vA1miLI+ismmyRq1k72wDs0r4i
 V7SuP5/TGU44d5Kbgu3q6SRIkdndkG3dXn+TJMysZBPg78WJb6cYClBtPPohRFexmfFH
 vwwZOQxKo8U+8TYrKn4ut9GB6kNVzGcvU5tl4ebZDohVYgWAVN9wW3mek9O2ESQxkvLy
 2iiQ==
X-Gm-Message-State: AGi0PuZlLQ/GLDwD6egiEe0wgket6r0qHmQyobScrMp4kCYQScFwBv6Z
 nHc9JrYE5Gln7q8QpvBPrMa44A==
X-Google-Smtp-Source: APiQypIHoMvdBPDAH55oAiJWQf6RibFWhqu9hhE+8pHtSpHhq+x7eXgq8SWlIaG48XiNsM5Bsy12zw==
X-Received: by 2002:a0c:8326:: with SMTP id j35mr4725435qva.205.1587157644575; 
 Fri, 17 Apr 2020 14:07:24 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-4058-2b78-ede2-0695.inf6.spectrum.com.
 [2606:a000:1401:826f:4058:2b78:ede2:695])
 by smtp.gmail.com with ESMTPSA id r51sm15137455qtk.89.2020.04.17.14.07.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Apr 2020 14:07:23 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:07:21 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200417210721.GX4555@bill-the-cat>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-18-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200113103515.20879-18-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 17/21] pinctrl: sandbox: Add mux
 information in get_pin_muxing
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
Content-Type: multipart/mixed; boundary="===============5943583248624494357=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5943583248624494357==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1Sa0i77dkqaUxqYg"
Content-Disposition: inline


--1Sa0i77dkqaUxqYg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 11:35:11AM +0100, Patrick Delaunay wrote:

> Add param information in pin information output.
> This update prepare unitary test for pin configuration
> in pinctrl node.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--1Sa0i77dkqaUxqYg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6aGokACgkQFHw5/5Y0
tyz6RQv6At/NyvdBJRpdAF61wk5VQgzw19IJUMH67mxN5hgyzR78YF32F4pSJ0Zh
AkxZrqRX4MhLtoo2pv07VqEtOpQt5OqHPox4/4kaLZAQTuxEzEqm/4MIVPyEbAof
EmO1Icded3m0NbcxPP/3HPInAMnpYSb3EnkWXQPqLGboF6FT/80sCLfprVVDWdQ6
EZgiafNIE8PvojYOmHvfHyf8zKpqhYQsRYbwVA6gAdgz67RgEtJgzZ/mRO/KP0B0
6zAsiJF9ifscoWGHlo/WDA7dNROlXASvAO0FY4pBTBU6YfP98ooypQ5jpR9niTrC
KTh1/5/pKtPV/yHBeiXse856Qats+bPNS4PLz8K7ZdakNovhgT6a20UnIh22++tL
YFmxINrnCKHc2f7W6GgBI1lfB9X6kdShaerdIvaiTulPo6MqojvGPeoWrITDceL0
qps0YNiCuuA3eTWvz2F82yCZcsy90Lq0bq78jFj96ffppcsCk5wSjeyQ5IedffeL
de2090O8
=zB2F
-----END PGP SIGNATURE-----

--1Sa0i77dkqaUxqYg--

--===============5943583248624494357==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5943583248624494357==--
