Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E542F8DA8
	for <lists+uboot-stm32@lfdr.de>; Sat, 16 Jan 2021 17:22:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CD42C57190;
	Sat, 16 Jan 2021 16:22:10 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF4BAC5718F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jan 2021 16:22:09 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id a1so5513815qvd.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jan 2021 08:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Dpkb1TLD3GS6A6jlKHNpl3ZDny/LMSKXHHkdXfQtWOw=;
 b=cAuC4+w9pEVFu9ZXRh0ZPJESY3y2X8XXx4pKvtN2ZjD6jPKk6KWWUke8oizLguYrgr
 m/vykVVFw0qJKc1ucrjjXSrvvXCrnQDM2rKNMf7w17TRXKipshiFzQE4ZFklVn+mFuri
 4hzWuhdS4omhSpHEsQXNHwRSHFzVxGpeo9pJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Dpkb1TLD3GS6A6jlKHNpl3ZDny/LMSKXHHkdXfQtWOw=;
 b=eEcbtn6USnuixm50jUjfwwKNeBAnDTW1Rnx3IReqXzbIk+tGEWHcN5ukdlfFFEU6ip
 HA/1Bnd5PQXTCv5TbmEMzaLA761ZqDJq6tFSyT+jeGBWfAc3oOWbpE29cIq+y7eMqqRO
 mLsZ3SZ8lZZpQoDXcqQ49i4QivJi9WTX5/V2i7zcZKcR6Q/0KnwxVEtXiObP/2QQhkF3
 Ctu+A2cmfdhtg+eJFStQjCt0im3XMIc/3H9iLIGM4HPkRaMMeRg1dc1ewAqpS6LZzz2k
 fX1Hx8+I9Av6dkwY+svWHNKbduDqAoXW8hzNvqWw9YRHgCXtcXlZHTLq19AR1oONJfAP
 qsLw==
X-Gm-Message-State: AOAM532iChsVTqsvaKcMrxfem4kaTjdahwts7bTaQ1veI/kARD4eml61
 5fSPc004c6UfUyM2/AOz/CtSRw==
X-Google-Smtp-Source: ABdhPJwQ3iHU3yOBI0jn0/GfbFXfgbCCNxxxghAF8kaZqQlX5Cehpls9Ya+vQy2jR9DIFz9Qr3oSeQ==
X-Received: by 2002:a0c:c3c9:: with SMTP id p9mr17128355qvi.49.1610814128739; 
 Sat, 16 Jan 2021 08:22:08 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b42-3f4c-bc5a-f8b8-3605-e048.res6.spectrum.com.
 [2603:6081:7b42:3f4c:bc5a:f8b8:3605:e048])
 by smtp.gmail.com with ESMTPSA id f125sm7375346qkd.22.2021.01.16.08.22.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 16 Jan 2021 08:22:07 -0800 (PST)
Date: Sat, 16 Jan 2021 11:22:05 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20210116162205.GQ9782@bill-the-cat>
References: <20201127102100.11721-1-patrick.delaunay@st.com>
 <20201127102100.11721-6-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20201127102100.11721-6-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Bin Meng <bmeng.cn@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 7/9] console: allow to record console
 output before ready
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
Content-Type: multipart/mixed; boundary="===============2442145138042911113=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2442145138042911113==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bEjdSXxHv0Az5++U"
Content-Disposition: inline


--bEjdSXxHv0Az5++U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2020 at 11:20:57AM +0100, Patrick Delaunay wrote:

> Allow to record the console output before before U-Boot
> has a console ready.
>=20
> This patch allows to test the console output in sandbox test
> based on console record.
>=20
> It is possible because GD_FLG_RECORD and GD_FLG_SERIAL_READY
> are 2 independent flags.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--bEjdSXxHv0Az5++U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmADEq0ACgkQFHw5/5Y0
tyxeOgv7BiA6XOZkteuttCgWKVCFk/vFwH23iMq8lj7VWpwE7Brr9GQ/HuElLidh
bll6/RRYCN6ttg8vXcQDGuIkjxsW67ecx5whLQpdX43ygnFvk50js9G9zgPUJoJY
KCBeP+e0fKOzKPjx5Qy+w+xXbZXO7lI89GraEWr0vxAKaduVJMjblCs/+fmWSncY
ri5JPatMmTnG7f7VwhacP6vaweXhbHdK68LbGFLwv/b42i2q0TIXeMLzUflzCHm5
AMie3R2ZYA32jl6LpCD7tZaqAFZ1trMRJFaSa4BIER9IaHoUZNTtu6+tNzhMCbwx
4chHR9RDqdHUyNNm/QJ85N//MI+JQfZcjLh8L40KgxTujtFStC/W5xq+R/2tSmZN
BirR+39Z/oIHQSpXuT7jPk1/SDAEaktIxUtva3CeEmR7N/CtyjIOmQ4MPAE1Yvue
kl8OgvJJjEyLchdN07WBWfgJvGD3yqnN1B0+dSfeKKK13ysClhM54wGb/1HFvy9A
Pa/laFEs
=ZHMM
-----END PGP SIGNATURE-----

--bEjdSXxHv0Az5++U--

--===============2442145138042911113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2442145138042911113==--
