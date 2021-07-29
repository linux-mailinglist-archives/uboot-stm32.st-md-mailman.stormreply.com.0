Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 615023DA962
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Jul 2021 18:50:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A7BFC57B6B;
	Thu, 29 Jul 2021 16:50:00 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82D6AC57182
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jul 2021 16:49:57 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id c18so6622667qke.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jul 2021 09:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=goPAgUHH/Hz05NsNc/OHxZkuxhwD1gsb/+gsnNGyX38=;
 b=taaIf9pJx+OzNwYXo8Y9aF3D98uSHUZRFzIXLbbGcOKiimqx1+wBMV4IhGSbY302GW
 inaVuRN1b58OoPFXX1j4bOm4HFT61rWbnymcKn2UYmXypS/1EwH1/IRIT2Qzg6T2Rswp
 /06+wNrCuXz7G52fSsqk94djaAz4JhA7J5NJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=goPAgUHH/Hz05NsNc/OHxZkuxhwD1gsb/+gsnNGyX38=;
 b=gQNUfxFm4ZM004eSD825ucx5I8CWNtwGWeIJEdvtUdmSCxomH1riOjHIXnLLrplrG9
 ZJgt8vUFfgj0k/MbXLAfCkJuInhHkxTEKOMhgpIKFSZ+Euq1iTbnuMShjCAL0t7L6K8L
 uustIJC+M9VwsNbdnCtfVM3lmRzCgqQylUyyhR9cC746Y/v8mVdefmT0FanvENuw3xgo
 Hl/19AOBHP5hBJ28E47DaO7UlH00rApf85XHXN/OfG+ednGLdg7mrmKMOpl5vcJ+BTgk
 tOkZ5HKdvSEu0xK5L80ynDSOUYhghwETKJ4sQZofIssB7xkEHL1GdnvDwWNZhjqtFiX0
 9L0A==
X-Gm-Message-State: AOAM530ELQCIDXSVr5wekO/4x8HtmTNXjrew+2o9pXb6hhMzsFR0exOs
 T00Ob34z3oEgM2n3Mg+RI+rE2A==
X-Google-Smtp-Source: ABdhPJys2EqZgSxCmnMY7y+FE+9Nsy/RgLq1R6K5HmK6/gCK2IECubSv5PN5zHzNoYgHMyt9SF6kLg==
X-Received: by 2002:a05:620a:13f8:: with SMTP id
 h24mr6245619qkl.350.1627577396624; 
 Thu, 29 Jul 2021 09:49:56 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-94ed-10de-2168-2ec4.res6.spectrum.com.
 [2603:6081:7b01:cbda:94ed:10de:2168:2ec4])
 by smtp.gmail.com with ESMTPSA id t6sm2014647qkg.75.2021.07.29.09.49.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 29 Jul 2021 09:49:55 -0700 (PDT)
Date: Thu, 29 Jul 2021 12:49:53 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210729164953.GX9379@bill-the-cat>
References: <20210721095553.RESEND.1.I550b95f6d12d59aeef5b744d837dbb360037d39e@changeid>
MIME-Version: 1.0
In-Reply-To: <20210721095553.RESEND.1.I550b95f6d12d59aeef5b744d837dbb360037d39e@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [RESEND PATCH] build: remove the variable NM in
 gen_ll_addressable_symbols.sh
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
Content-Type: multipart/mixed; boundary="===============4866294042683643370=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4866294042683643370==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6JpNyHZcz5HoP3tQ"
Content-Disposition: inline


--6JpNyHZcz5HoP3tQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 21, 2021 at 09:56:07AM +0200, Patrick Delaunay wrote:

> With LTO activated, the buildman tools failed with an error on my
> configuration (Ubuntu 20.04, stm32mp15_trusted_defconfig) with the error:
>=20
> ../arm-linux-gnueabi/bin/nm:
> 	scripts/gen_ll_addressable_symbols.sh: file format not recognized
>=20
> It seems the shell variable initialization NM=3D$(NM) is not correctly
> interpreted when shell is started in the Makefile, but I have not this
> issue when I compile the same target without buildman.
>=20
> I don't found the root reason of the problem but I solve it by
> providing $(NM) as script parameter instead using a shell variable.
>=20
> The command executed is identical:
>=20
> cmd_keep-syms-lto.c :=3D NM=3Darm-none-linux-gnueabihf-gcc-nm \
> u-boot/scripts/gen_ll_addressable_symbols.sh arch/arm/cpu/built-in.o \
> .... net/built-in.o >keep-syms-lto.c
>=20
> cmd_keep-syms-lto.c :=3D u-boot/scripts/gen_ll_addressable_symbols.sh \
> arm-none-linux-gnueabihf-gcc-nm arch/arm/cpu/built-in.o \
> ... net/built-in.o > keep-syms-lto.c
>=20
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--6JpNyHZcz5HoP3tQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmEC3DEACgkQFHw5/5Y0
tyyCJQv/dHslWFRPp4iiqRwb66X1yUkDuudbm8qu73D3Oq246bgA4gKY+f8+tLkd
UqwfmwBxYt/Uw0qQxa350fl2TOd2ekVrKbIjOjgdIU+oefFl/GFY+3WMIwMfWD0U
6u6YcXHunkDr5AG5lNXzsNqSp7OgcECEvOQYJOjyS9TGMLi493zITlnTTHB72/Q+
cUdU8dW5o9M/4KncRCo1h7r4JnvcA4S3Jl1pSRHlpYntdTG+5SZLDCnLvUtn81mO
gkclfVOWZUwIeKAPzrFAJp5ulebkADYuOxbM8U/3XFwMRNzHN1a7xd9j2511J3jX
A1PzMLDhL7Fc64F8mJoVopF2/QIDkw7gwEgZK5gG8olvuvG4+RP59ut6xQeDd+78
wN/q5oR2glnWocnmT9rkbNO2X8WJXO4pUo3LS3qxA++Rh3ko3WhbQh39otdOA0BO
/Nc7O0ZzHllK7Zlt5KOdwABM6mqHc0WKFa86kcb9AfUxyiuga8wKiBHhCGQg9S2s
4ffMNcZ1
=c3oZ
-----END PGP SIGNATURE-----

--6JpNyHZcz5HoP3tQ--

--===============4866294042683643370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4866294042683643370==--
