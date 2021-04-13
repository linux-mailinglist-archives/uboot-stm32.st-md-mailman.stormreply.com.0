Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C8835E169
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Apr 2021 16:29:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91B66C57B76;
	Tue, 13 Apr 2021 14:29:27 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAB56C56632
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Apr 2021 14:29:25 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id f12so12838777qtq.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Apr 2021 07:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WPygApQkJG+j1Cx2cqVTmGQXA7T/uzcRFeglwBz4OD4=;
 b=B/BU/b001qfGO6Mz0lbQHvk3gQCgmAvODqesQZqSg5A84q4w4nfmVR5EU0xSd+VFi6
 qB0zgMKJImygrNr3GN+oOpuT00j8zYa0260ejVfbqTfqY+LyW+QXoRgtTtbLlpMWtO3J
 bYrpsdWrSb+LlkTeBIGlNEOnGO1F2gqcOZphI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WPygApQkJG+j1Cx2cqVTmGQXA7T/uzcRFeglwBz4OD4=;
 b=QvIz6C1qL4CBuycTZrxkOS80knYez8HEaK/ReCLxeq+x5hLcrOOXGBK6ceHWKoj/N2
 fRHs9KRvFWc6pRp/FNL3kQoZtlGWZWGy5ZJUoqxbmuH/VOh06ssl8hH8HgRFD9daVV2Y
 bMGb/ngzcB1sMaDKcckw9+6WyxC3wGscSOuWbmff90f4WLiCCSOMyJoMpqd3iuRVldTN
 WI1MveBkxGH5kjDNhT2xmM3rZDSaeuls2/9qjDMFFzEbQ2vFbKrJYI9ZHhxkmtKHgFY8
 R7GG1uTgUV2MZQh+tfn7G5nPRT96/m6G+HCtfusXsBsfxDVkpiTQAzkbZZ/Blxyg0lOg
 dQlg==
X-Gm-Message-State: AOAM532xfiCbsydD9GHCVxp8p/8sbZ8KSDb47UP1/166VQu+l+XeJ8uV
 orkK4sfW/MuHSE00SPuUsLLDGw==
X-Google-Smtp-Source: ABdhPJwxOH19i9PiZFyysAjIZMN6txroeUjfEuuaDfAkuuIx3Cv+L95BxlxjW0bONKjPTUD2NfL7dQ==
X-Received: by 2002:ac8:4b7b:: with SMTP id g27mr30004192qts.220.1618324164929; 
 Tue, 13 Apr 2021 07:29:24 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-140-239.ec.res.rr.com.
 [65.184.140.239])
 by smtp.gmail.com with ESMTPSA id t4sm3666026qkg.75.2021.04.13.07.29.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 13 Apr 2021 07:29:24 -0700 (PDT)
Date: Tue, 13 Apr 2021 10:29:22 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210413142922.GH1310@bill-the-cat>
References: <20210316092937.1.Ie4df1c787d51eb06945ee580b4ff5248c609ab7b@changeid>
MIME-Version: 1.0
In-Reply-To: <20210316092937.1.Ie4df1c787d51eb06945ee580b4ff5248c609ab7b@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Sean Anderson <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] scmi: correctly configure MMU for SCMI
	buffer
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
Content-Type: multipart/mixed; boundary="===============4232549840958765262=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4232549840958765262==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LE9irl2/QEmHxxtg"
Content-Disposition: inline


--LE9irl2/QEmHxxtg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 16, 2021 at 09:29:40AM +0100, Patrick Delaunay wrote:

> Align the MMU area for SCMI shared buffer on section size;
> use the ALIGN macro in mmu_set_region_dcache_behaviour call.
>=20
> Since commit d877f8fd0f09 ("arm: provide a function for boards init
> code to modify MMU virtual-physical map") the parameter of
> mmu_set_region_dcache_behaviour need to be MMU_SECTION_SIZE
> aligned.
>=20
> Fixes: 240720e9052f ("firmware: scmi: mailbox/smt agent device")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Etienne Carriere <etienne.carriere@linaro.org>

Applied to u-boot/master, thanks!

--=20
Tom

--LE9irl2/QEmHxxtg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmB1qsIACgkQFHw5/5Y0
tyxBUQv7BXtjt43NfC3y10S2Z2ZuPLwYUz1GqNMS0frZK7IlDMUHCgEYLfTK6lYW
la2NX+hCaZv379p2AGL1Z4cNrbpVcYiEVb4LyfDsRMawYWDGpYjseoOweIms2pat
syWpmc+CBc4WBZ+TF4j5rlwv/ZgJ/EvMuV9XEtToEBqFIaem0O8ocPd+GZBjjSI/
6HIMfjZHe6vRB/gkRNi4/dTIEfv01YJ2uBpFbG0q+fMP599cd05smQ7Jjvyq3PMG
IJS9aP8HrUtJuY888C6+ypelJr2MRrliGMdvJo6N3seN2d47VCqbb+FJiAtgaf/p
gvzmC61XR21PDfVt1d4LFr74tZhsTC4C5kvevG7nbo97WlRT386HLQmJqPU3Bfgf
Kcp4/d+oQEy/OG2Vbu7OwbISirJHePhi8qUasam2RkjevkfxgS9SuGO3hnJJAP+i
N6h7RDQXgyCh+3jtRqsJMswDP7sF3HZrwDIoyIxs1oBAOHb2SfN+M89sG6byrso0
ItNYwuCl
=LUbo
-----END PGP SIGNATURE-----

--LE9irl2/QEmHxxtg--

--===============4232549840958765262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4232549840958765262==--
