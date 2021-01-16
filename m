Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CD12F8DA6
	for <lists+uboot-stm32@lfdr.de>; Sat, 16 Jan 2021 17:21:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B59DC5718F;
	Sat, 16 Jan 2021 16:21:58 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2927C5717E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jan 2021 16:21:55 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id h16so5524196qvu.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jan 2021 08:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hWBD2tnHq5yNsPnp77l8L4wiTEh9yFdkesoQpTWB+k4=;
 b=KcCrpr5JVjcmZtaFDnL5ajYneYofFImm/WenE8faFHxHawFvX4Tt/MRW9FLCkaS2cm
 mV/MbSCYNFT8vthbLkoR6y/pCtbUMFgC0bpYLVkvJ+CrBF3CGs/Pe1mNdJiff2eekkZw
 w9MI6/eGcdrXudbrF0NkvR5lbBcGzo5fuIzd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hWBD2tnHq5yNsPnp77l8L4wiTEh9yFdkesoQpTWB+k4=;
 b=EQT1vTZHV9RhzQyDtY+PiwBzZnQNi2jYOXv314qD43DQMtD1lwZa8TroTuFGGxZUhw
 rWUo1M7uDyaU4iRdo8rPJxn8hfMKc3g06h9k2PExpoVXwy2kFCfh1f9T2pbNQYw8hSTV
 PW4njlKC0jL2mr7sHuRAm9NgEcM2I0IuMtmVqYBlr11XGEv2GfQ7fFkf+5NyGcOF4Oef
 eYWeF9Uq+CldXN8efD2Hl4kENaTaVJvCieR1KuwhKNYn7jotPEUnTiTYZNK+Kl4OHipx
 B1ScOAyqrD5jAKxEy6aRW2y5ppOQ7x0vntRuwJgytTRXfR0EaVL+tIVy7A98RVWG4y06
 kxSQ==
X-Gm-Message-State: AOAM533o84Zd5hUyfsEE1AIarftCqKky69eGTEsM+YifuawYhl+OrxQ6
 C6WDnlWkoM3qEx5Zd4neg0mG6A==
X-Google-Smtp-Source: ABdhPJy10h+lTglmBm7oLAx6ccccgZBokpnM9fF0hBte2mZvb01ieow+xhn7nXD6XDNfjrwaS3e8AA==
X-Received: by 2002:a0c:8203:: with SMTP id h3mr17272137qva.0.1610814114703;
 Sat, 16 Jan 2021 08:21:54 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b42-3f4c-bc5a-f8b8-3605-e048.res6.spectrum.com.
 [2603:6081:7b42:3f4c:bc5a:f8b8:3605:e048])
 by smtp.gmail.com with ESMTPSA id g3sm7082351qtc.3.2021.01.16.08.21.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 16 Jan 2021 08:21:53 -0800 (PST)
Date: Sat, 16 Jan 2021 11:21:51 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20210116162151.GO9782@bill-the-cat>
References: <20201127102100.11721-1-patrick.delaunay@st.com>
 <20201127112000.v2.5.Ic62431f5da403756a2cdf753ce3656555a4263af@changeid>
MIME-Version: 1.0
In-Reply-To: <20201127112000.v2.5.Ic62431f5da403756a2cdf753ce3656555a4263af@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Sean Anderson <seanga2@gmail.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 5/9] test: add test for dropped trace
	before log_init
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
Content-Type: multipart/mixed; boundary="===============5593735633254753610=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5593735633254753610==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BuBclajtnfx5hylj"
Content-Disposition: inline


--BuBclajtnfx5hylj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2020 at 11:20:55AM +0100, Patrick Delaunay wrote:

> Add test for dropped trace before log_init, displayed by debug uart.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--BuBclajtnfx5hylj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmADEp8ACgkQFHw5/5Y0
tyzV/Av/X3jkFVweEbJwEwS9BR2ykCTF/RarYtajAjYcIaQoDq5fzZW7nFk5kE+G
LPwVegMX6e7fTtF9S7J2qlyLD8NqKqsItmR0hTMiyqLmBrPycj5ihln3LuuPc+VD
S78cebg7i8D06Jkk448MdS5rT3P4xcEDQAvykgMzA71lmwNm3K08ZNvc2rlWFE5V
ozNyq7Fc7VoxjlLRK/ZBRgr+/VJVPfbpfJBfHpnXxVoJ+G2/eOKydgv29bHFwWb0
Dv0UeVSAPoKNxTH0RWopw3P+KrgTris7jn7y5zSYzS1wEjzF8Ip0l4Pq2Rm5xYdM
Gqbb1vTiZQ7jG5puiLP/qVH+FBFvE4nCD8hVuRLoi0+mABx/p84DI5FTXUZaH1FD
c+d1O4SldAWQShs4xJ9oZsWopwk2oBwTXgHP2bMu11oOJqoRE5FreSnCSeNq1oBk
bZoSJAB92JaOBLv7cFdVMMay/oXSQKerESbAL18JTwcg0qc4AisVALLybiouoIFy
yZCHODSo
=fRWQ
-----END PGP SIGNATURE-----

--BuBclajtnfx5hylj--

--===============5593735633254753610==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5593735633254753610==--
