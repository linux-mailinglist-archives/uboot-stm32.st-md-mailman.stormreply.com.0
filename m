Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A97D21C8BB3
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 May 2020 15:04:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CB21C36B0C
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 May 2020 13:04:25 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77705C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2020 13:04:24 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id w29so4580692qtv.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2020 06:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9REXjERr7Y8ngoinG5t5hW3q99RXbu2A46oR0X5yt2o=;
 b=e+6+1ieWQsDycBZza+9BmD+l2AfVqYyImH6c5SMy3u0FZnceujTnD+vesUJWrnPktO
 I/yPp4YG1G2hlaodEZbDJBmJPEUDGTut/uRO0ZKxswzCYDFQNa0QiJl30v7pkUhAoklj
 h1aw961nQZayaaqUuhq0kBnTk3QnqtoxNO5tk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9REXjERr7Y8ngoinG5t5hW3q99RXbu2A46oR0X5yt2o=;
 b=axBEjQXkWS1NO0uyWpt4RDD4FuKHLsNC2P+m8x8eIIl3kBtIMdOdzS0OhHABEOwf9t
 c4d/q4c1HboM34kz+T2xL5g9TYF6GeQPquyN/dCmhotTeoAyt1cBH8778iVDxMqD2tXe
 qPVPgz5lfgLl8LGmm+/JiEwbL7zV34w2gAnuqc183TgF468qu+0C6KTfKfJKlfJvaxYp
 wY/UpA58u6L1Par92QfK2vppOXXF0cA25ie6aA0b5q7IWMPx0csohbxkpwJNoaRtVGb3
 0o6/5pHIX2wIUt+5Cn0H6y4r2qjlfwy3tOqNnYuzTRNaT4DwXE3Ra9jOQfqmWvJI/loN
 9K5g==
X-Gm-Message-State: AGi0Puaq2vD9/7f6D5WbS7CqAqttjZ9o7hBZxsHuPWAkujcFK705WIfT
 CgOaWtgYrlK/0Aq55FdEwAshzg==
X-Google-Smtp-Source: APiQypKq09KZ//smPzRbv9QWSglopW1ly4ZN3pZqe90zaddHOAEewlT4veH7Na35wG4wQunmpyTNeQ==
X-Received: by 2002:ac8:1788:: with SMTP id o8mr13837235qtj.15.1588856663231; 
 Thu, 07 May 2020 06:04:23 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-7000-c596-aa5a-d094.inf6.spectrum.com.
 [2606:a000:1401:826f:7000:c596:aa5a:d094])
 by smtp.gmail.com with ESMTPSA id p10sm2833691qkm.121.2020.05.07.06.04.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 07 May 2020 06:04:22 -0700 (PDT)
Date: Thu, 7 May 2020 09:04:20 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@st.com>
Message-ID: <20200507130420.GD12564@bill-the-cat>
References: <20200428093804.20773-1-patrice.chotard@st.com>
MIME-Version: 1.0
In-Reply-To: <20200428093804.20773-1-patrice.chotard@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, Stephen Warren <swarren@nvidia.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Simon Glass <sjg@chromium.org>,
 Ovidiu Panait <ovpanait@gmail.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 Eric Perie <eric.perie@yahoo.com>, Patrick DELAUNAY <patrick.delaunay@st.com>,
 u-boot@lists.denx.de, Trevor Woerner <trevor@toganlabs.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2] cmd: cache: Fix non-cached memory
	cachability
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
Content-Type: multipart/mixed; boundary="===============1435561799104590562=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1435561799104590562==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uR7YiQvNOb/8Y6Dg"
Content-Disposition: inline


--uR7YiQvNOb/8Y6Dg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2020 at 11:38:03AM +0200, Patrice Chotard wrote:

> If dcache is switched OFF to ON state and if non-cached memory is
> used, this non-cached memory must be re-declared as uncached to mmu
> each time dcache is set ON.
>=20
> Introduce noncached_set_region() to set this non-cached region's mmu
> settings. Let architecture override it by defining it as a weak
> function.
>=20
> For ARM architecture, noncached_set_region() defines all noncached
> region as non-cacheable.
>=20
> Issue found on STM32MP1 platform using dwc_eth_qos ethernet driver,
> when going from dcache OFF to dcache ON state, ethernet driver issued
> TX timeout errors when performing dhcp or ping.
>=20
> It can be reproduced with the following sequence:
>=20
> dhcp
> while true ; do
>   ping 192.168.1.300 ;
>   dcache off ;
>   ping 192.168.1.300 ;
>   dcache on ;
> done
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Joe Hershberger <joe.hershberger@ni.com>
> Cc: Ramon Fried <rfried.dev@gmail.com>
> Cc: Stephen Warren <swarren@nvidia.com>
> Reviewed-by: Marek Vasut <marex@denx.de>

Applied to u-boot/master, thanks!

--=20
Tom

--uR7YiQvNOb/8Y6Dg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl60B1MACgkQFHw5/5Y0
tyxYagv/faO8HznWuJfXM9IiLJhQ9vxa6+vOM8cyvRA+DmQN+RJJnzxa/0Gz4mRS
XVO/vSulBw67NuX5SSK6yxQ8Btk9ePtyMxrsnqYHYOEwROxAJqKcAu3Lp4pwlCMQ
xSgUHxIhV0xJDCHHzvsb+pLsdBnyITZ/oU0l/ujBhU1a3wSvXWBndnPncLf9gPvG
lfRA16z2N0yAFd3yGFyWm+2YUim5eGhBwDAZU9b2ZDBJrT9VA2GHBcJDI9x83plK
si0a32/Cq15WoGcmO+Atb18+A5XKWuWumUOeA1YN+5abWCOhuWQLcuKGvgNh1Ier
G5aT6PwjXqRPy2LamIeVc+7do/u8FrUbJ4ZXeEHIWq4UTcdhpc53A8Rz/B6W9Elq
4YG+TORTc/5iL2cs4ekBJzcVO2kl9a3cw4IPgE96QWEdLrUtkN0RmQ+2/0nHU4FK
AjdsH3yxudrCIAn0jtnV1bqh/T4NGfrJ6mMLdDR23uz5H5k90gVa1QDOtFPXAppl
x5wg3RsG
=wY15
-----END PGP SIGNATURE-----

--uR7YiQvNOb/8Y6Dg--

--===============1435561799104590562==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1435561799104590562==--
