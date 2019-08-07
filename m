Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 018AF851F7
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Aug 2019 19:20:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A9AAC35E01
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Aug 2019 17:20:15 +0000 (UTC)
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
 [209.85.161.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1ADC4C36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Aug 2019 17:20:12 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id q128so32741714ywc.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Aug 2019 10:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=l1Fi1fCuQ2az+ziPS7Y75dY3yo6TXshq52Q0oe3xXCM=;
 b=c1HnntBUyQAQbbZEptaxPWp+0TvR9/qclVPaEz1uF9lVp5QKk9tpsXK1T2KSI09fhN
 f7aUV9aQdM+qy8Qmxu+XMFrSBjQ9Cy3CX7isnTT4PENUitMfkj3ttmyJZVUPjQvTHgIW
 qM31Sns9I41wBmgyQl/TTmHsw2qh7I4p43aQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=l1Fi1fCuQ2az+ziPS7Y75dY3yo6TXshq52Q0oe3xXCM=;
 b=klUs8OJCxlD7BUyjJWRHlcPDzaUHyWqH4WGfGZuBW5xJIDujBU+IbeiczEjXDgd+oq
 32JQi84r7tT3duUnZDj7k3S48aRKz2D7EIvSs6ned8gzelMOVy1CpkefPksZyt7AxROe
 E/e1I+GH0ry7Cuspjd7/tUe/SRQphpFnm/faqFftWv06DSBuXzqrWK9i/D3e8XQCCa3O
 F3JE7KeYZRjQOPv1iOai4ibvcxKT7iL/1WOAreuZRM5kFQlHgAOujvKsQgYzu1kKqpqd
 cwFUb6u1DJN9/4ZlYbrKVk1fW7ts6YL4B7MMz2eyUT33MDit/2s0tc/DLNtDrhs2tgMC
 AfUg==
X-Gm-Message-State: APjAAAXszl+mYfdJBkBlpxqhFshH6tylXqQYW+O4iIDEhxxFbY4VOFAQ
 727F9nQ8in6gKXZl19joieqnIA==
X-Google-Smtp-Source: APXvYqwNfu3mTXqTZlrCT3fA/dcJViieRmrmtbIog0SZ2ddcNlBkg/nuY+iHaIb8NjUioEr1iOuXHw==
X-Received: by 2002:a81:4f8f:: with SMTP id d137mr6837178ywb.122.1565198411741; 
 Wed, 07 Aug 2019 10:20:11 -0700 (PDT)
Received: from bill-the-cat
 (cpe-2606-A000-1401-82DE-5CE2-C4E2-4F31-D572.dyn6.twc.com.
 [2606:a000:1401:82de:5ce2:c4e2:4f31:d572])
 by smtp.gmail.com with ESMTPSA id 206sm20661939ywu.34.2019.08.07.10.20.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 10:20:10 -0700 (PDT)
Date: Wed, 7 Aug 2019 13:20:07 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@st.com>
Message-ID: <20190807172007.GA30533@bill-the-cat>
References: <20190725071239.31398-1-patrice.chotard@st.com>
MIME-Version: 1.0
In-Reply-To: <20190725071239.31398-1-patrice.chotard@st.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Sven Schwermer <sven@svenschwermer.de>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH] regulator: fixed: Modify
 enable-active-high behavior
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
Content-Type: multipart/mixed; boundary="===============6186895695690393622=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6186895695690393622==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2019 at 09:12:39AM +0200, Patrice Chotard wrote:

> Regulator should not be enabled at probe time if regulator-boot-on
> property is not in the dt node.
>=20
> "enable-active-high" property is only used to indicate the GPIO
> polarity.
>=20
> See kernel documentation :
>  - Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
>  - Documentation/devicetree/bindings/regulator/gpio-regulator.yaml
>=20
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

This breaks building on a number of platforms including khadas-vim

--=20
Tom

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJdSwhHAAoJEIf59jXTHXZSNvEP/Rs4AR9H4PmeCo3y9BOsaA3i
kH2fUslY6l44VrAsUb0ZIkZECJMQWE5bDqCai51UDOcoTKoB37/Zu2cmjM9d4YkS
Igcc/4eRPFUo0ea8usDIdcHw2x6DWGBzoh1vwTlgqwC0mKeZNkE2zY0YRJAIaUym
Kzntq2P+j56VxE0Gz/rGHnRgNlZIxdiCMdJx0muchFjAxm3gXEO/i4i7NdBcOuLo
YuzJ81PjKkZ2bf0EO6TgWDKZf8nXxLqhqtYd8JDzlRfrtoSdvorhiLR3hhOPgNsy
Ecmz8ZyysTFWf+zeoKY2Rq5pbb9sU8oUcn3+CW4Ar7xRnBFHZZk4nHDl4RvN+15W
a93i75sEh+LQPkPo6RcM6dmL0kdPOZ7rNAFRgGKwN5YD6NQJe4jexidB87RVNrmW
RxVJUQ9g1VCIg9wpCCocnFg07NvjTetDBku9ea4l2RYc78ZaUGcSphR76+LXAwgb
Q0k3WW73TJF2aQtqIJg4iev/GmRDjhZgXL+8lWHjeZEe1k6V0oFDHVAQXsKKWggN
mBg/BCKPfWtYNaL4T4iEktdyCkOutjhqlzS0/QvkNNqOm2urcjAZzoyokBCxgk58
mho42MEBXjb5tSIiq5tpyDJK7QVj+2p6zGtNVdsJNu5dICPc3mdU3EcUk2CvJgDZ
FjN08o3beP77ExuuniQW
=0Ke0
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--

--===============6186895695690393622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6186895695690393622==--
