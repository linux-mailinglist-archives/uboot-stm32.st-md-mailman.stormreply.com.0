Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD4C2744FB
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Sep 2020 17:07:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84217C32EB3;
	Tue, 22 Sep 2020 15:07:53 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75410C32EB1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Sep 2020 15:07:51 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id w16so19343883qkj.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Sep 2020 08:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zzg2GFxKO/CMmjV+/6NOVrXawiGVhyypn7s4TqSiONg=;
 b=jJ5MPrG43K+LovuOot0QEa1n9fFvwLeIvu6UStJrjX7tcpUCudSk44XJ1hU+vKK3+M
 vRIZaZkq+hPH50ujRGF7nkOcwtt0lootX3kpse3TYTwS+w5iQOmmDSTQw9ymvA5XJzFn
 tu06CE1d8YqRPH60nQ08W+ClURJ2RYQFXRt4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zzg2GFxKO/CMmjV+/6NOVrXawiGVhyypn7s4TqSiONg=;
 b=o5yfrtFO/v/NXHnQf8Ud760A9xS+adtCSLeRfEbMuuw7lNyzKFVs+tVDRKnB3cGg5Z
 8TN5LDeq7vkY7xu8oyIjrbZiKyN5usOW1hOQLwRba0mVl4zsN0vdXg8XtXVHsT5RcB8X
 v5dqaNLzoRVmZsC6WcMrZWOFAaJs1mgETII8oJHlflewwEKyWWAQKYyAOLF9nDgOPLjc
 CSlEF0bri+JUu+aI6px8eirKiykZ7h9jLoaXY9Yux6ga06jNbyeKSsFiXHHf/UpSC2IN
 jIvJO0ptXMoysglSVZZELV2PhDMHgEfJNFU8WrgJc4LsDw2AGWxP7H9yooZQD2nFEb6Y
 4pww==
X-Gm-Message-State: AOAM532Fss+EH7nrifVlxDj6Y3qe23al4o6YEEp1oMwePGGPWSseVyvR
 lMQHsms5wEmfqJ1pP6lyvf0z4g==
X-Google-Smtp-Source: ABdhPJxZEyMIyPbIuSDEP8rH4d7+tSWCaz2ss7B6vAW9OtPBnKgPrkhFApZO+zz2vGCTlbOKl8CwEw==
X-Received: by 2002:a37:658b:: with SMTP id z133mr4742425qkb.221.1600787269520; 
 Tue, 22 Sep 2020 08:07:49 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8ebe-a44d-5ac0-e6e7-4c04.inf6.spectrum.com.
 [2606:a000:1401:8ebe:a44d:5ac0:e6e7:4c04])
 by smtp.gmail.com with ESMTPSA id i18sm4882577qka.50.2020.09.22.08.07.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 22 Sep 2020 08:07:48 -0700 (PDT)
Date: Tue, 22 Sep 2020 11:07:46 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200922150746.GD14816@bill-the-cat>
References: <20200703153646.28533-1-patrick.delaunay@st.com>
 <20200703153646.28533-3-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200703153646.28533-3-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, u-boot@lists.denx.de,
 Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [Uboot-stm32] [PATCH v3 2/7] board: sunxi: change trace level
 for phy errors managed by uclass
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
Content-Type: multipart/mixed; boundary="===============4278874816805415697=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4278874816805415697==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w5NuKm87q7qyH/qV"
Content-Disposition: inline


--w5NuKm87q7qyH/qV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 03, 2020 at 05:36:41PM +0200, Patrick Delaunay wrote:

> As the error message is now displayed by generic phy functions,
> the pr_err can be change to pr_idebug.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/next, thanks!

--=20
Tom

--w5NuKm87q7qyH/qV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl9qE0IACgkQFHw5/5Y0
tyym7Qv8DWf8bmRqs+qevewTWdjypRqWdTYoNptww/UhLyuaH7uP0L+OvNOPMOEg
IPx1K8ok/A1wvSWB7xTx0ZEYSB4poP7rIObnIBhifChbb1QJto9vDonc6ZeHnpKs
AGclTzGLkllHDC7IN26GHgganEAD8xjDNL/P9AdhvdjBkyE65Hs+TCM02FrX/Y7r
IWDM8tvZR1xOiqF8KidrFuZQZHIqkroxL8GRc/0PNt7zhGQ1sH3DrowMcbSO/Wer
eK8MXaflEiE+cCedfulADaUA4PHi/SQjdmaNB769bH+T6yEP4PJy/nFVIOrU1noB
elSgxz/+r6P571r8BCLt/PmrXvVQlil/0lhp4EtmrP0apG6TpI11vGcQsVXeCtcK
Tw8mellsBaPQ6MlnNdTI3NPLM47Hcza2w2jaVrFki89awbQapfkX04nF+PwzWJGd
AgM2k+7TtRTMAqge0PrhTA60KB5/kcBR1PolDJusvGsQcrm0+sTNsNmk84/Cpfbe
dzhUyGg1
=Xxc9
-----END PGP SIGNATURE-----

--w5NuKm87q7qyH/qV--

--===============4278874816805415697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4278874816805415697==--
