Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B24FB1158C5
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Dec 2019 22:48:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 811DAC36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Dec 2019 21:48:35 +0000 (UTC)
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
 [209.85.161.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42A87C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Dec 2019 21:48:33 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id w11so3295580ywj.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Dec 2019 13:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GpaX6trA3oPaZNfhxKPoDxauArKhLY6QcYvDmlDr/7M=;
 b=UOEGvr73qsscvx5Uh8v+C6g+CuH+P2owbjyuq1V9kSIaXX8jLpF7gScstuSkuEo1PX
 St72RImmiWQTBYHs1GBSf9MLl74uFyrQ3gwykUbImYO4bo21U0MxaD/XriqAXV0klTuJ
 IxoSEbxLfHLZuFnWkll0QXNpOcgop9F0j5sHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GpaX6trA3oPaZNfhxKPoDxauArKhLY6QcYvDmlDr/7M=;
 b=JEkJl0vCovFZL7Sq6yEsbMe1NzKETYy9zFn7LQDFOQTJAT3GL22NxCH9XFAKz+NfvJ
 Mb7q99cg2VCYEGutZH/MIlwD0Fvox9q9L/+MHAeOMg4YFp5kM7P1o7NoukQUETLyZiDi
 v1E2t3wmCLAQ8Kh8q+E5cKXA6XDyvJxkOQPnPl2P2Qv9BFI+dR1RojWox0ahAimcHS6k
 uPTmzVkt0trMOemwZ9K40zo7zaZ5ROtygQ+Bpu3cGzmigmvWhuDFqVWijMv/Cpj1X+PT
 dCIgzYB/kXtXTG22Hx05pl6QW5QdFPAixT+6gYfCRfeQPmYv56a43Mi8OV7u/YsT9S8c
 ETDw==
X-Gm-Message-State: APjAAAW+ZJUBoiCu9l3qfpzsYhklQQ7vZvy9+T9r+h87YgRUMdfqOknI
 KvXH1Nno30a0jgTFpLIcWP7BAw==
X-Google-Smtp-Source: APXvYqy1KoMLsIZV+b3UFKF6962HR6UNFpKfc8k7nki8qA50uCgbu0qoIo7hxYrZeoI/KiL0SqqL2g==
X-Received: by 2002:a0d:f882:: with SMTP id i124mr9982998ywf.126.1575668912107; 
 Fri, 06 Dec 2019 13:48:32 -0800 (PST)
Received: from bill-the-cat
 (2606-a000-1401-86dd-d558-5e40-3af2-2592.inf6.spectrum.com.
 [2606:a000:1401:86dd:d558:5e40:3af2:2592])
 by smtp.gmail.com with ESMTPSA id l39sm6905688ywk.36.2019.12.06.13.48.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 06 Dec 2019 13:48:31 -0800 (PST)
Date: Fri, 6 Dec 2019 16:48:29 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@st.com>
Message-ID: <20191206214829.GZ9549@bill-the-cat>
References: <20191125080741.2215-1-patrice.chotard@st.com>
 <20191125080741.2215-5-patrice.chotard@st.com>
MIME-Version: 1.0
In-Reply-To: <20191125080741.2215-5-patrice.chotard@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v3 4/6] cmd: pxe_utils: Fix
 checkpatch WARNING/CHECK
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
Content-Type: multipart/mixed; boundary="===============8392102453743954732=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8392102453743954732==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6wuYZoBM8ToU2kx7"
Content-Disposition: inline


--6wuYZoBM8ToU2kx7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2019 at 09:07:39AM +0100, Patrice Chotard wrote:

> Fix checkpatch WARNING and CHECK issues
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--6wuYZoBM8ToU2kx7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl3qzK0ACgkQh/n2NdMd
dlLNIBAAiL8k8ySThGU4Das74e3UIRlF8nEEcNDHjMt1jE2fgc+UxV0NrFblHPvc
OWLk6bzI/0n5pzkWDaLIQSmdcs9FOiRwOxiOok+YoqSooVAbB7D05B8th3RO7Ra+
V97IFU2Cv90UFoVPUcGaRD3yaojeiGlf/w7LbVX5xTRL0aPax4Wdv4SrrD45y1UI
2Q5TcWlOXIVQxjAk7nD3NHhE4yF85kLJmetSqNb3Ev73NZRWoiekBbxDWRtUugz8
8KpXD3X0JmsU8przRZB41AZ+G6DmaVE6ct/2DGMR2EpDYknPmpbogDMXS0b8ze5B
hxWYAsWJRqlNHuyNgfIq/9opCR9PGZi+Sx6j6lWu2FmPBOXIulDTkv34nv32U+7I
u0TsSjYklWwlDeb62eUiJaSPoPh53kqXskovFj7LqM3I2P4Lsr/sGNUTdfVwG/UP
st9GYrY0ufdTZkihNVcrfAg1xUR/bUfVYwHJ9FPRpIMmDz+Q5lPhNVlNF7PbSgud
XIKGmAmjHuCFFiY3v3ZYIXo6xyl6HCf8yF5iGLYyEMngaTA4tWJjJLEViPRY/qGJ
sdWGHyLw3rTHm8+WEQjxQHUyJcePhiX83y/7bfZ37GEHiQUv0Q8fF/UT6zz5XwfT
0uI4mq9fVf1kw7UuTkzDaPoooImGcEvge27ik4lYmbNedG0JiOA=
=zUKm
-----END PGP SIGNATURE-----

--6wuYZoBM8ToU2kx7--

--===============8392102453743954732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8392102453743954732==--
