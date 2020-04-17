Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D3F1AE728
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 23:06:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2FEBAC36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 21:06:24 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71635C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 21:06:21 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id x66so3967865qkd.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 14:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=gluvoyAZ3va76wtuTkkDy3aSMBN3ITsxSEoGbijQbdo=;
 b=NFlizs6d1dYVzchzWhe+duUO7e1ffUX+Aa3vdv5SBlJZURzgg8anGB1lSzbOez7w1k
 TVxwlptDeKpFP6wQRyCVe0AXCpMfPujTu+dM7JchDDJ9NQoSDFMuYaslXDWNu2uYQzwQ
 rFuhL0RuBkye9jARx5MuNf9BWnAPqYyaa/snw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gluvoyAZ3va76wtuTkkDy3aSMBN3ITsxSEoGbijQbdo=;
 b=LKVfwAuG5zNSgEn7b1gVC+QZDgkDTdmMbbBD0yL4dpwajw6JMS/2y9cSvvNKl7J5bf
 ST0D7IW7mQ80LWpGeHaD3LVfSoKMM4MnvkA2DU6nCb0gVYIb4hYHT5SthFlk5D/DsNyk
 3dtksUnp1ITgtEfzkQEoYWiRc/dvDeeMtpG5WBzoQ/d1clVEzvuEun8oqx84YLWb2504
 XyA8Rxe4UE6r9IZNmRaGc4nuvCTtmjy7HOYwWAIlU31nHBDEV74flWIyiaI0NJhdgWvC
 fsnZKREgeLKACzOZMcQJ8ik7QU5k0u1Tif6LErd78SQqY4xHCfsCVek/W4sItha1bbX2
 4AVQ==
X-Gm-Message-State: AGi0PubEPppcsTrALwhbLMO0SmoWF6JuMKWfIrEMFuEGkBP5C4/CyRTh
 4R3kxCIaykjqhRe+tGqbnUSH2g==
X-Google-Smtp-Source: APiQypLCQjQFC20oHvBOlnnJeJPNR7AziomRsMSdveqWr9OLLoELWjiv5Ks/MblnyAGlVUZQhpWBEA==
X-Received: by 2002:a37:414f:: with SMTP id o76mr5242076qka.462.1587157580253; 
 Fri, 17 Apr 2020 14:06:20 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-4058-2b78-ede2-0695.inf6.spectrum.com.
 [2606:a000:1401:826f:4058:2b78:ede2:695])
 by smtp.gmail.com with ESMTPSA id h23sm3100486qkk.90.2020.04.17.14.06.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Apr 2020 14:06:19 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:06:17 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200417210617.GM4555@bill-the-cat>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-7-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200113103515.20879-7-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 06/21] gpio: remove the open_drain API
	and ops
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
Content-Type: multipart/mixed; boundary="===============6512528819422023033=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6512528819422023033==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FUaywKC54iCcLzqT"
Content-Disposition: inline


--FUaywKC54iCcLzqT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 11:35:00AM +0100, Patrick Delaunay wrote:

> This patch removes the ops get_open_drain/set_open_drain
> and the API dm_gpio_get_open_drain/dm_gpio_set_open_drain.
>=20
> The ops only provided in one driver (mpc8xxx gpio) and the
> associated API is never called in boards.
>=20
> This patch prepare a more generic set/get_dir_flags ops,
> including the open drain property.
>=20
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--FUaywKC54iCcLzqT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6aGkkACgkQFHw5/5Y0
tyzt9gv/dCwfPbYTGiycZCPHuz63r3HdzI8+FeGtw8XIg+YZErE0ef3gE5rYUCyj
tHgkapd6ZG1dXfqihosUH5zXI8BlIRbo1Jq6Xv6WdS8peDjFRT+mWZ4/Qg+nbhen
4Eb/cOyaxheRvgtPGR7EEMq16LZeMYCJRpkjPiDfK/qbzA4pnhOTYCFqiq6LWvgI
uiMmYCzhYtPyNLgWM00z+TInWNly0Du5zZi2UfLhzxc9/90LqyZ8X9NMtbgdlHFA
9kGa+LnrMeFV0kbmZE3RiO9lEkslhEOMPUiIGsAAYH0d7ybC8qqlWvHshcCWPQPl
9HqARyO8Jd9euiEhJPf0F+917mX5SxBl6H0WCcmrmy5dtuGyaiFFwRXEMdxmNvd+
DzbcsnRKihXCPF4lhCN2OLj/QHHVMi9cjFK0jlDT5KThjwsLW/sy4xODNBYDqbke
kLh6oM0HmE6zblYKwTm1CFr313FfpeQh6MFCy5tvj3gzx2bSjmMYatrKbil34owY
j+Gp0rOY
=DCim
-----END PGP SIGNATURE-----

--FUaywKC54iCcLzqT--

--===============6512528819422023033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6512528819422023033==--
