Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2761C2025
	for <lists+uboot-stm32@lfdr.de>; Fri,  1 May 2020 23:56:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41C59C36B0E
	for <lists+uboot-stm32@lfdr.de>; Fri,  1 May 2020 21:56:32 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 134EBC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 May 2020 21:56:31 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id k81so7953549qke.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 May 2020 14:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zU6POWAIGOFrJFjhenQCUGYMz4QvvMBrIftzNqKNw9M=;
 b=Hu6RDAqDBmxPcB6tvC/ZURxAJ7Iu5roOusETEi4g6iqxVbLbKSUBYkDZJvk72I899A
 Wn7s/nvRhXqcrP+M5XEtiWv0XKrAezO5QEVzCKZvbeJjYP7Ug5d93iQk5S60UyqtrgRY
 GX4pCnWEvgqFZITcFr1HaqBKkhh5YyHEke88U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zU6POWAIGOFrJFjhenQCUGYMz4QvvMBrIftzNqKNw9M=;
 b=ob6gPM+/miLPi+a705Eu3kgB8PMIFxJlm/GeXonTCXQ/boAiqGYY5pUM/d/N/2keSY
 0nGzFMBbEHT00bAPSNFU6KaD3SymsPXa3Cq9hnRXVaJOjPRtjcK/f9zZ6PSMkrbKMQqa
 4DHm/dhoF/N0NGngXLa1ZbS0jnqPW9BSNi3UaIk3Fqj1+GsaWz7HWpMd/SRlPJxO6/ns
 T7lpHVR6SLf3nMXEdevvQpPdrCJXKDT97qFQiqKBgpjhU1jA1I9+TiCfaR784/NKwMnP
 yW/WHKFTrkTi2gLY0wlrhaGk2uTw5I/oY9pG7EzaKFjND2v4TmiAE1O1j36nuVuigzra
 a5fw==
X-Gm-Message-State: AGi0Puav6lc0Do3yIJAXGyqEQgWmCLBqZoENv7buWhcsGRPYsb+9uAQt
 13GzVQccfWBNsIejijSxzJNHZQ==
X-Google-Smtp-Source: APiQypKAHF6HRX0A28J3/OL/N3SqUGCq65QhlDLA55CS/PENkM8LvcrDkjpoSMwj+2/jvjYkS+rweQ==
X-Received: by 2002:a37:e214:: with SMTP id g20mr5672523qki.374.1588370189837; 
 Fri, 01 May 2020 14:56:29 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-8453-a408-e16a-eb16.inf6.spectrum.com.
 [2606:a000:1401:826f:8453:a408:e16a:eb16])
 by smtp.gmail.com with ESMTPSA id h25sm3778529qte.37.2020.05.01.14.56.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 May 2020 14:56:28 -0700 (PDT)
Date: Fri, 1 May 2020 17:56:26 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200501215626.GN12564@bill-the-cat>
References: <20200424182017.11852-1-patrick.delaunay@st.com>
 <20200424201957.v2.3.Ic2c7c6923035711a4c653d52ae7c0f57ca6f9210@changeid>
MIME-Version: 1.0
In-Reply-To: <20200424201957.v2.3.Ic2c7c6923035711a4c653d52ae7c0f57ca6f9210@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, Lokesh Vutla <lokeshvutla@ti.com>,
 Simon Glass <sjg@chromium.org>, Alexey Brodkin <abrodkin@synopsys.com>,
 u-boot@lists.denx.de, Trevor Woerner <trevor@toganlabs.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2 3/3] arm: caches: manage phys_addr_t
 overflow in mmu_set_region_dcache_behaviour
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
Content-Type: multipart/mixed; boundary="===============8579308125269767453=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8579308125269767453==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="enGqbSaueFq5omEL"
Content-Disposition: inline


--enGqbSaueFq5omEL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2020 at 08:20:17PM +0200, Patrick Delaunay wrote:

> Solved the overflow on phys_addr_t type for start + size in
> mmu_set_region_dcache_behaviour() function.
>=20
> This overflow is avoided by dividing start and end by 2 before addition,
> and we only expecting that start and size are even.
>=20
> This patch doesn't change the current function behavior if the
> parameters (start or size) are not aligned on MMU_SECTION_SIZE.
>=20
> For example, this overflow occurs on ARM32 with:
> start =3D 0xC0000000 and size =3D 0x40000000
> then start + size =3D 0x100000000 and end =3D 0x0.
>=20
> For information the function behavior change with risk of regression,
> if we just shift start and size before the addition.
> Example with 2MB section size:
>   MMU_SECTION_SIZE 0x200000 and MMU_SECTION_SHIFT =3D 21
>   with start =3D 0x1000000, size =3D 0x1000000,
>   - with the proposed patch, start =3D 0 and end =3D 0x1 as previously
>   - with the more simple patch:
>     end =3D (start >> MMU_SECTION_SHIFT) + (size >> MMU_SECTION_SHIFT)
>     the value of end change:
>     start >> 21 =3D 0, size >> 21 =3D 0 and end =3D 0x0 !!!
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--enGqbSaueFq5omEL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6smwoACgkQFHw5/5Y0
tywKXwv7Ba5BOg6FsGsntvL9n1Witcz9xq6n+Y6tzEgetZy8OCNWUUaOu1Ifrg1T
N8vltOYNi9X5SSemrWmdikZAuVut4BLVUjwgHFVWU0TFIJnRJgRj38gJqPKT06bv
+v3BqjRx5D1E+jF0WBNFzJqAV+fsI98Zf7D3gIMvWhtNxmRxPTsmHMlic505bBbw
SfrPK5Ot8HWvAUOAPoFC8XSOkCMmMY0EmCUxwi2+lmGH9pTimUekba02V7wlNeE9
KOBI3WQBLA2orxreg1n88VYf5okL/VLL/fZqd9jw2jTsKq4vonAsjuPVXyvlo8m+
IL5TIkIOdGWz9783SkHpOxoVtehpowkEQ72MPyAiSi0UdTl2eKivitGJhPTEpSC6
oZtQKuSmq2+Bi6FiYIrbNHyzMW41xl2l42jWciKEssAj1lSsf19BkKGSBBMOf/EP
HGpSNVOn9piZacmA/GPUgD7WqY2MYFVzNkwmGV6Wt8P1oUeF2/SXMBjMZMwQpjVu
VXY39Gs9
=A1cV
-----END PGP SIGNATURE-----

--enGqbSaueFq5omEL--

--===============8579308125269767453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8579308125269767453==--
