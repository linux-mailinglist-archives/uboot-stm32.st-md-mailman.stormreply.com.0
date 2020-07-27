Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C1622ED6A
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Jul 2020 15:33:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05C0EC36B25
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Jul 2020 13:33:45 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFBF5C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jul 2020 13:33:43 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id h7so15166130qkk.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jul 2020 06:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QT0qotYeqnhioKl9BsqT7gV3nRb5A7VhNJ9Yz3TBZTQ=;
 b=gCH0beMQxsr+OH2muj2SxhbFTlcwwhAcOsWUVIciQKalNY4DEgbmsUrLFl2nAzOqBe
 kiJpwjLVJpUdGpj0iHUq8FR9X8nkYsxcqZS8TZpWxbpK1cEyuyrf50gjfOQrHm99Wsan
 pidykuxZDWsxUpr388ZUjqHhhjavcg1RnA+kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QT0qotYeqnhioKl9BsqT7gV3nRb5A7VhNJ9Yz3TBZTQ=;
 b=PjoBwHa1S+o68clQfl5IE2c/PM7jRDRmwEgj9g3LJcZgFSR5Rp5okWa3emNysgc+lb
 /eMRjJKW0xDmnHgQi19AMAxSbaj7rWCkyMeM6vY9uDJqYrKWJ85BDlIcy5uFFu6CZM2M
 R+NxGjc56COf1izDnUkJjrH2JIMSuR/HyjlR6CQ25oOgO4WcWcIucYCc+FtpvMDM/23h
 dF9eE1haQ3d8P7O9/57hJr8pxkSEWpbZ76adO5JZgTBZCrpO1yfTuOYGQIIofT95SLev
 piprYKGlPsMYdZslRyVSs3Za6/zLqvIcP9RWsxHT3+Eyw5fN8dvsmwUAOED7pbtJaxar
 W+Ww==
X-Gm-Message-State: AOAM530+pcc2dPGESQzx3psgFRl/J8DYq59MQYRoAnwYEJCOfCacP1c+
 pVF5xYIaoJKSInO0aTWetYz5cg==
X-Google-Smtp-Source: ABdhPJxc2YUNpHXHaeeOMhU2joRbl0SiGMCzAwP+4DfCu9CJZzjf4LwVrX00fr/UXSmi8qLQfofrSw==
X-Received: by 2002:ae9:f205:: with SMTP id m5mr20307570qkg.119.1595856822869; 
 Mon, 27 Jul 2020 06:33:42 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c61-f1b9-a518-346f-c376.inf6.spectrum.com.
 [2606:a000:1401:8c61:f1b9:a518:346f:c376])
 by smtp.gmail.com with ESMTPSA id m203sm16990970qke.114.2020.07.27.06.33.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 27 Jul 2020 06:33:41 -0700 (PDT)
Date: Mon, 27 Jul 2020 09:33:39 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200727133339.GL6965@bill-the-cat>
References: <20200619120337.17042-1-patrick.delaunay@st.com>
 <20200619120337.17042-4-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200619120337.17042-4-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Mario Six <mario.six@gdsys.cc>
Subject: Re: [Uboot-stm32] [RESEND PATCH v5 3/4] configs: sandbox: Enable
 sub command 'env info'
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
Content-Type: multipart/mixed; boundary="===============7044293473597142533=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7044293473597142533==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Rex5+51txc1ort/q"
Content-Disposition: inline


--Rex5+51txc1ort/q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2020 at 02:03:36PM +0200, Patrick Delaunay wrote:

> Enable support for sub command 'env info' in sandbox
> with CONFIG_CMD_NVEDIT_INFO. This is aimed primarily
> at adding unit test.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--Rex5+51txc1ort/q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8e17MACgkQFHw5/5Y0
tywkiwv9HVUzm5GxcvNhwJ21ih5s+njtxd5zgsthyYNZgOGFAuPQ7HJJSjatU7f3
iHysKdwp0SJwGDdDb01em1wfQtBKXpRSbhkMfpf/ss0oPxtu0eNnkjyoBir+p8/o
1e1/kpw4azlsEEjExHV5PmhVLaXDM7CGTQ9BDtJvb4wdgrayIwOoR7rX4dPgrHke
t9eVQxZJfJKP4/n7tMiyX8l65pRYJL8xZgcnz2Mpmkhu13Pqexff4fqTyvgenp/H
iFqS7tLWQLj+tfIQyn43caJk81JrW+4sdo8Bz2PSPxxqAeG2xql0KdTwk5x/lKbk
dwjSJo/7uWvj5OW5ryXV62n7/uy0E0ypyfXHDbUjJMx804bArjPraJPgBhsxtWtM
LRpXr7CghfKMiD5lFGJts755dUirVWHiEh4CcvNor7S39sTKNZt3mq8RDqZhIHsr
uEj6mDmbxfacATQsnLQRiv6ANGRrBUCn5yP3Z52+DPbbNssbdb3IObvh/7qya4qR
/QutX1e3
=yTxa
-----END PGP SIGNATURE-----

--Rex5+51txc1ort/q--

--===============7044293473597142533==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7044293473597142533==--
