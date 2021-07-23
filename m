Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF953D3A4E
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 Jul 2021 14:34:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43BEEC5718F;
	Fri, 23 Jul 2021 12:34:02 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2510C57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jul 2021 12:34:00 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id o13so1154708qkk.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jul 2021 05:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=j0O2DLc13Svtby2T6mJFNYGZX7PXGBN5iw1mkaae93I=;
 b=GJrdGVFZRCTzCr+PfFs+EFjR7sLkH9zr0oGITmovNl/b2rL3JIkyPkZIhJX7671Xan
 IYBoKKcVlalqA3+YEm3k9RGEDH4gSr8lCs9Kn4sDNkC0y2DLWvByhkIezMeeMw/z975h
 u48LfGr+Ult6vHXj4sIpz9r90tvwiaKkyveSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=j0O2DLc13Svtby2T6mJFNYGZX7PXGBN5iw1mkaae93I=;
 b=TrRsMlZjw0hzBlShWWISXY8huuNrHicWmiogR537tsQDqQORGjlEm2iXWSSsK1tpM9
 A+paWDh+P7PtWjfZVurM8DQ39xm2weZ+5bsCFQ521JCVe0lDLiaKoNmLhIetV7QBx0+g
 KZRMsywpd+cD795/iqaFqHgkxPwahZ/+cGNcMGZ6j1qsGjQ9TH3FFvpVRQiTu/V8my48
 j1hkJPxEsSXZkHIn5JcYyddLOpMqKczIyKk0Swp27nGgn9XobuNiYZjhmLXeJ44LQOZp
 hUMH29vbFMMGjOUDvMJw60ypnV62n7NFvUS22aFk6zT48KEuEuMM7btq3cqPA2U9AQgL
 fwOA==
X-Gm-Message-State: AOAM533NQCtSEWdm0FrxU5ZF722GHMr3p4wQRGSwO1T+/iEFAJAyn3Cd
 1wZt8TV4o/ubitfeKwZiObGwTA==
X-Google-Smtp-Source: ABdhPJzpBXw1frdvP2xVCm/f3vXTsnrYDjLePAtb5hxYuonJXndOsIXPo8IpDTQqsOUY1e3FcwZw7g==
X-Received: by 2002:a05:620a:171e:: with SMTP id
 az30mr4465991qkb.325.1627043639820; 
 Fri, 23 Jul 2021 05:33:59 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-5560-078f-fb66-41c1.res6.spectrum.com.
 [2603:6081:7b01:cbda:5560:78f:fb66:41c1])
 by smtp.gmail.com with ESMTPSA id m19sm11388131qtp.93.2021.07.23.05.33.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 23 Jul 2021 05:33:59 -0700 (PDT)
Date: Fri, 23 Jul 2021 08:33:57 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210723123357.GO9379@bill-the-cat>
References: <20210521094728.v3.1.I6851dcbaea90c8b6ddcca5310e3c4ee58c824706@changeid>
 <20210521094728.v3.2.I5b7085079ee5504cad399697bf6afef6710fa02a@changeid>
MIME-Version: 1.0
In-Reply-To: <20210521094728.v3.2.I5b7085079ee5504cad399697bf6afef6710fa02a@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 u-boot@lists.denx.de, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>, Pragnesh Patel <pragnesh.patel@sifive.com>
Subject: Re: [Uboot-stm32] [PATCH v3 2/2] cmd: pinmux: support pin name in
	status command
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
Content-Type: multipart/mixed; boundary="===============3458811965089788571=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3458811965089788571==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5IYJRsx6KNVuKrR5"
Content-Disposition: inline


--5IYJRsx6KNVuKrR5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 21, 2021 at 09:47:32AM +0200, Patrick Delaunay wrote:

> Allow pin name parameter for pimux staus command,
> as gpio command to get status of one pin.
>=20
> The possible usage of the command is:
>=20
> > pinmux dev pinctrl
> > pinmux status
>=20
> > pinmux status -a
>=20
> > pinmux status <pin-name>
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--5IYJRsx6KNVuKrR5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmD6tzUACgkQFHw5/5Y0
tyy9+gv/eqUz4KS7S1iFqUFzZBnbfoRnuzh0lEEYfNtijpd8H9kj4S93kuTuXnfO
xhWpv+u805+KA31LQk5aQqSngsR2khjfCtQnZvaPDoDwdFWuPJQLZ240mZGHcCAT
b5d1hu4GNDJCAOqWsx5N7aq9ydUUtxz/9nFFC9rHCfxyhzxyyMMkoB/K/eRLjz4A
w0mtzcN0HJ9rSktxRZBfJhGnwL5nVo1qCSNrZk5nSr+aR4sHdjgHnBw5GsLwq58G
f/bMEqUrvJnm/u0HShvUdcEohrBGU0fO+7Ed90q8bnxxUJskHLjGGHvqy/L90kRp
Rt2zMQ1hA5h3CErXeQAVY+m8tPeP2rBFQ1mbjI49E8LON/BHqR+8pQifYuTn0vQ+
FyoAA5DvDoPx4KQl1b7jRrk9fnnfYyJ1ODeLEXNIHZDsMPx1hQPRr72UMCz97dx7
a+K1BmHfDKNDM145QVG339c/Mgv27HdQAiXcuUJTbNJeCvaoD0ReAOlIpXFteLV6
CWExYua4
=BEOE
-----END PGP SIGNATURE-----

--5IYJRsx6KNVuKrR5--

--===============3458811965089788571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3458811965089788571==--
