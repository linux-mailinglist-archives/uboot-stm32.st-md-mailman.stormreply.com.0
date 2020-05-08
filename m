Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D9E1CB64D
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 May 2020 19:49:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DAECEC36B0F
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 May 2020 17:49:28 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7956AC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 May 2020 17:49:27 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id x12so1979079qts.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 May 2020 10:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BHFdYHbxKbjPpOm+LC58tsm5CJ16GEiv8+OMZzIqOrk=;
 b=svCYASWqREk6JZw62MvOSvOC5fs8IgFc0WPSKM0TZ0zB1TL3f/fFY7dzBuJM/c/Uq0
 XbTuEIS4TckGW9loNclqeiy1Hwmyzqzm9HcFClat6GSjThW7ZNxBd7inechHWIv+OB27
 0nN6MaqRPySOzI+nh/xn9I2y/Gj4nfRtO1/9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BHFdYHbxKbjPpOm+LC58tsm5CJ16GEiv8+OMZzIqOrk=;
 b=gNbfTET4G3RUKpGbLU4A3NjSJtqr6a54j5FRHhrCU4cV7D/1F3mjDQoN4vO773JnvI
 p8b437fy1LR5Wgymx61yxjW1r0AYqO7Im9PbgPSohs0gi7FN33fzabPNV5xQTllSVXHJ
 KBO+QMGVkUHnl8xyNYCde0GdO3OOM/ixZw39zEhlkwjSD1qXHpOg7u++nGLulklpgBt2
 eVdTpyK7X6ZsQqMWy0tnzvBQ7x8kpn98C/PMIhEvFGDHNzXb5HDSjNDsytNmbmFifhFJ
 /e5tuhkDx5KSDNQKIGd9KlcGMqj1iYDNZ/3IeeEYWGs8RjIHXBkNpUU0oh7Nwixe1sNu
 uS+A==
X-Gm-Message-State: AGi0PuYmfhdLciN3NOtpchHNMWcgNkHGw4RoMhJFStg85eic3gRjFAkV
 XCAzdPie1fneJHTXShpRlGVI1A==
X-Google-Smtp-Source: APiQypJhDrWUi5e9nPZsDk0NuRtePtwSbIFBUc2yC0HimLw60vcNnemSGPgAii+Jovku6k3cQF6bZg==
X-Received: by 2002:ac8:6bca:: with SMTP id b10mr1911667qtt.34.1588960166298; 
 Fri, 08 May 2020 10:49:26 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-d970-79cf-8141-588a.inf6.spectrum.com.
 [2606:a000:1401:826f:d970:79cf:8141:588a])
 by smtp.gmail.com with ESMTPSA id p24sm2062766qtp.59.2020.05.08.10.49.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 08 May 2020 10:49:25 -0700 (PDT)
Date: Fri, 8 May 2020 13:49:22 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200508174922.GI12564@bill-the-cat>
References: <20200226092842.5413-1-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200226092842.5413-1-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, Holger Brunck <holger.brunck@ch.abb.com>,
 Simon Glass <sjg@chromium.org>, Pascal Linder <pascal.linder@edu.hefr.ch>,
 Lukasz Majewski <lukma@denx.de>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Kever Yang <kever.yang@rock-chips.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 u-boot@lists.denx.de, Mario Six <mario.six@gdsys.cc>,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/2] configs: migrate
 CONFIG_SET_DFU_ALT_INFO to defconfigs
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
Content-Type: multipart/mixed; boundary="===============2919954332813973891=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2919954332813973891==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LWrJum1q/OvHB6h/"
Content-Disposition: inline


--LWrJum1q/OvHB6h/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2020 at 10:28:41AM +0100, Patrick Delaunay wrote:

> Move CONFIG_SET_DFU_ALT_INFO into Kconfig done by moveconfig.py.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Acked-by: Lukasz Majewski <lukma@denx.de>
> Reviewed-by: Jaehoon Chung <jh80.chung@samsung.com>

Applied to u-boot/master, thanks!

--=20
Tom

--LWrJum1q/OvHB6h/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl61m6IACgkQFHw5/5Y0
tyyn+AwAoP/AKGWQUxBPkindlz25D7izyI20RYO5fGxhcWCR6Q3BmkDMStvOzp6x
TkmmtUEKYkt+K/rjGLWZ0SnE8pdi4g4j7kK8YNDVM5Mu17N5Od+PUNfuKtaKrhjY
MpEgTymKgzq9F5AlpcUGD2NrTxh/SlMy2MuHwcj93y2680+bvnSXlJwwWIDTOTrG
CF0XBhsoYRSyqSLRjhSv4GZyQ5LF4L6AZdKcwyhQIi2tBBcf2KO8H9tj0ej7M58K
k7cd34SjsAHEN2wbxxqHj9054riKaSKv6i3OtBAqTJT3/G0meYMqfubv/VGMdxkr
1ev0BQEEkFF3eBOKNCNq6jUe6ZE/S3jDNsRGfL71fXRDzY3ZTOTcFjM5U53LQS9h
M+4cKjYiu3Z6pNtHJyVmWQet67xOnO2kBt9wNpo/X7nzz+O+Bwkjm/NleseD+jiX
E9Oyreug4AMUD6ivH3fvXJBFYDG880KJfIaNSI/a85Qi7akstjOI/ObvCWCPcXQd
iUgn47BO
=eVw1
-----END PGP SIGNATURE-----

--LWrJum1q/OvHB6h/--

--===============2919954332813973891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2919954332813973891==--
