Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4041BC044
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Apr 2020 15:54:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59DEAC36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Apr 2020 13:54:21 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2934EC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Apr 2020 13:54:20 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id o135so9359089qke.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Apr 2020 06:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Ov/KdmLbq8s5klYyQkCEpjjEIqGs8g3PoCt+eFyfvVQ=;
 b=Q9RLUPc21zz2t+g2lSfbdyqpPX0LJzj0u5ywgMSR8UesY4LuyBeACgnUYHqOl0Kxig
 rrNS9ZWXvWXj42B0eNxkSZ/N749TAE0WEHAK0gsS5XTAa3aFacZHkKbK2t3Bt177loSO
 3TCsbbu23U1mXy/PPw2S1FK1gBzC5uD07tzv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ov/KdmLbq8s5klYyQkCEpjjEIqGs8g3PoCt+eFyfvVQ=;
 b=ZVZzkOpzah6PkoIyspht6ackC+zltYa9C2P/hZj6WWZXDdY7zVB1yGma7bpHuhpjkO
 r7x1hRubj+RIkdgEJ+HDb8aco0EtgtoER9IulzkgJ/xCodeAd48wWPelVLj62aonAiH+
 Pk7lnSAt+IXuZtPKnlipraJU+JhsX+qurY9i6tlmBX4cwdbtPVlr29QMoErSyI+VTe2j
 Orj6Nb3Eob237fv/6OoWMBuwG7bHzWLvBxl6Frw2dnmxiaoxmdvv63eChlgByHx1gXBN
 87gmAPjXz30G4TkxNJiujIP9/zFYwmW7pOvbj/VjdTYTnMYc0gnrP41VMQMzpo5Hmkgq
 jLbw==
X-Gm-Message-State: AGi0PuYXfbB2auRf7NqJaCEDIX7dE51S8P5pW+sW1yfwu8ArzPbj8/c8
 lnHtyeCCES0HLIycatfxZIrNpw==
X-Google-Smtp-Source: APiQypJLHKDNNDTF6Np/X2+r6CmDHbi3YNHtQu2kBFxrhdZAHIWTyfWFcHsKIXLqlF/FuQ4qrpXkhw==
X-Received: by 2002:ae9:f712:: with SMTP id s18mr11446394qkg.394.1588082058973; 
 Tue, 28 Apr 2020 06:54:18 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-c4e8-427e-eef8-640c.inf6.spectrum.com.
 [2606:a000:1401:826f:c4e8:427e:eef8:640c])
 by smtp.gmail.com with ESMTPSA id o33sm13960984qtj.62.2020.04.28.06.54.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 28 Apr 2020 06:54:18 -0700 (PDT)
Date: Tue, 28 Apr 2020 09:54:16 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200428135416.GO4468@bill-the-cat>
References: <20200422141755.1.I8b005c35223011e3c07122ccbf558bf8d27b6aab@changeid>
 <20200422141755.2.I7e1980e0938cb60ddf2b7fea2778d9987291da99@changeid>
MIME-Version: 1.0
In-Reply-To: <20200422141755.2.I7e1980e0938cb60ddf2b7fea2778d9987291da99@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Andre Przywara <andre.przywara@arm.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] net: tftp: remove TFTP_MTU_BLOCKSIZE
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
Content-Type: multipart/mixed; boundary="===============6042620354936564931=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6042620354936564931==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="acOuGx3oQeOcSZJu"
Content-Disposition: inline


--acOuGx3oQeOcSZJu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2020 at 02:18:26PM +0200, Patrick Delaunay wrote:

> Remove the unneeded define TFTP_MTU_BLOCKSIZE.
> Since the KConfig migration done by commit b618b3707633 ("net:
> Convert CONFIG_TFTP_BLOCKSIZE to Kconfig"), CONFIG_TFTP_BLOCKSIZE
> is always defined and can be used directly to avoid confusion
> (fallback to 1468 in code is never used).
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--acOuGx3oQeOcSZJu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6oNYcACgkQFHw5/5Y0
tyws4AwAr+/xBryOrhKQtFQQyNj4TYHvShF7Fe6VfxCl04G4xxrcmjsBTqWN+sFM
qcjU682nfJAopKEwbSeG5jvkNrzpj6azz0w8r7p0UFTYBhJLG3t5cAA2hXsZpQuU
GY9uADDwC2QPBzfdUYq2OyrXyIcEVJVBQH1/+DYUbVxZBCDzvB2IXROGITizURaM
3flI71dcYu43ZAr3EQXZKYi1ophX9r63vaJwXIbylQVtGPcr+58+OkIhAueg2sBP
d2Hpp2e79fPW/9KfJ0Gru0GmFKJlIIr+k4BLHyPyUdNzijv0k+mYes1zisamwcTe
cBJSyqO14q3t1jNa8LcL7RN5oBPHOMsYgNybbTfaMT9cdGwgH7hPoLfSDUUd+3GX
P4nCVZ9mnqh77Eb4Qf/24rerUHSdz706qnKzy3jPUd+kRMKCFncha4DybbjhJKMZ
a5kxLW1s8Ml4LHHi+6xnCTLcpCEWMeU77dwcAYzg4sw23rhUbML9ds2C7KtWrqMP
pvaa8LNS
=jmVd
-----END PGP SIGNATURE-----

--acOuGx3oQeOcSZJu--

--===============6042620354936564931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6042620354936564931==--
