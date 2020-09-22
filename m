Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB162744FF
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Sep 2020 17:08:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE3E5C3FAD4;
	Tue, 22 Sep 2020 15:08:17 +0000 (UTC)
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC8DEC35E2B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Sep 2020 15:08:14 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id e7so15761876qtj.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Sep 2020 08:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2z+tAkFp8z4VIHSsQyqGxC2fZq1KgjT9xghZulytU6A=;
 b=FGwQAWzh8VJfbnj69if7kU0n6iWEBw6uZ35xKJF9gCVG+evBv5tVI1D2WsTP5kjlHP
 dir/TIGkZU+NtK9s9WtpXPgmeXUf2+c6kYD5TV/Cul4o/A8DyeHZpueTE7/00Zb+smd7
 Y1noskaqFl2jLQHVgej90P6YqxaNFYPUURwc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2z+tAkFp8z4VIHSsQyqGxC2fZq1KgjT9xghZulytU6A=;
 b=Vxg2MMLVaWrtHo2Yf5lNFtW811RKBuaxDR1e4RMIqSSSOJNiNLgqm4qiBhhCxhfDNU
 3ZehjR8pPhLc9vygSBpDRx8L/GEloOxRzWp/UhhDthGMfD3vKiD5LVvOjL7ghceCLrdx
 b4WzO7gnhcMiERGObg+aoUBZM2/mGGRRy+/+QisolH2HdQdOuIf55HvGuMUoZNbguIwY
 TFBSJzI4i//p/9pC3Z8XLkMcAI2aGiZkxn5ibUSccWqtSvzBluAD5gafLxWKp7VdZ89u
 AqeCIVhcSp57960jS7ujYVyV4PfXPTzad/Qta/EJ9GGK4lLh1qqWssKl/YyNHFy6S86H
 U46A==
X-Gm-Message-State: AOAM5320uEYXK1r7Cun16ZahJ4zfixWv4j93lEm4MvCW2jF4ROhPbtRb
 OZS0psYcy/rmOoSQkQqDMICRjQ==
X-Google-Smtp-Source: ABdhPJw4MMUURuRDaeipKN+bPoSiOWAJFAUndg1btsPp4UgLSNfW9RGxfEpIoGMWI++QDy/lbwZUJg==
X-Received: by 2002:ac8:3aa3:: with SMTP id x32mr5002053qte.327.1600787293797; 
 Tue, 22 Sep 2020 08:08:13 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8ebe-a44d-5ac0-e6e7-4c04.inf6.spectrum.com.
 [2606:a000:1401:8ebe:a44d:5ac0:e6e7:4c04])
 by smtp.gmail.com with ESMTPSA id k22sm11540973qkk.13.2020.09.22.08.08.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 22 Sep 2020 08:08:12 -0700 (PDT)
Date: Tue, 22 Sep 2020 11:08:10 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200922150810.GH14816@bill-the-cat>
References: <20200703153646.28533-1-patrick.delaunay@st.com>
 <20200703153646.28533-7-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200703153646.28533-7-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, Simon Glass <sjg@chromium.org>,
 u-boot@lists.denx.de, Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [Uboot-stm32] [PATCH v3 6/7] usb: musb-new: sunxi: change trace
 level for phy errors managed by uclass
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
Content-Type: multipart/mixed; boundary="===============6647185458337514207=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6647185458337514207==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PQOEDtqHNYuC9sWW"
Content-Disposition: inline


--PQOEDtqHNYuC9sWW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 03, 2020 at 05:36:45PM +0200, Patrick Delaunay wrote:

> As the error message is now displayed by generic phy functions,
> the dev_err/pr_err can be change to dev_dbg/pr_debug.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/next, thanks!

--=20
Tom

--PQOEDtqHNYuC9sWW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl9qE1oACgkQFHw5/5Y0
tyxvPAv/SwHvQwuwfxME/DNpGlrTDOd9b2ayQoW/ceqwR4FteXdDpUyu2Z/8/nss
Nw+d6ZYYd29jRjCyXw6KMw7J2qThdTUEyVKTIgfUSgzv8fSCxUvxVtBmjltEC07s
QqTjbUK9wuz3Yze7RmNXWJMID4ZO2ZbpRomfSDAd5v4TTvBVFjOgoBgyF8uROC4A
A/zJOYm2+IkabZ47iH23BvTTY8oIytT7pQBy1oqfLghI6kYLzVlUiEDCMzKS5VzT
RIIXunGOj7britmZcOb8pIOWG2YFlecrYFsRvqvTSRWb1JQeFSQI6MRED2J+mGz0
8VlY0T3WIUe87lJETDBjTqnzJuyQiq2A0hA2NjCXqBUHCnMd/YjJKjjer0HJnV7R
/7xYrAwkMilVcRR0jnCC2hWjh688Tr/IdJf53AQZijulgbY8Ie2i0vPGZgy39g9V
yhEHiUHtqjtufzPvbAvI8duDTygUc3xobhf8aBLdbCtlJ9VlALTi7rZOyUvXX8zC
vROOG/14
=ScC5
-----END PGP SIGNATURE-----

--PQOEDtqHNYuC9sWW--

--===============6647185458337514207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6647185458337514207==--
