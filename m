Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA52234D3D
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 23:41:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 156CEC36B33
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 21:41:19 +0000 (UTC)
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
 [209.85.219.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95E6CC36B32
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 21:41:16 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id s15so10365684qvv.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 14:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2LhwMNK2AyM78/FCsSrNlUDTQMacWbd78z0r03uv5o8=;
 b=luLeTF6H8NZ+VsC6oDG3mcwqpKujtqJCO9ThrG73fZ5CMtFPI4jBtEAkjechv48qfO
 KYMHYyMZJ6FQ9RfXLk1DPFyOWm3CnIHBhSiE+CnIRTjEuIpVen2i6D6yU05mPMi29D5f
 sqAJ3ZMBXIWr6CI3bU4BbW6L+BABSm7ChiVXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2LhwMNK2AyM78/FCsSrNlUDTQMacWbd78z0r03uv5o8=;
 b=H48/qH0G3bZtRni6j/fk3oUxxXhGjQlnbWx3FvV84E9XObSyQZhMlsKcVj1RLvPaJw
 d+fRu6fT4OwSqCFo6mt6sgPUvMdKqnSm9IqKjKEdeKxTAWPLdEu/4uofeSEBU8Vvikfm
 JhPcm6zTTa4tv418emD/JVLT4s4CcSkKRwmuyL+8vCMuvtho+PhCrO2h9TgfTrEPn2Ot
 TkTNOPD2LjSNidAWZwTbrPr251adh7z10S7TeiriLJPERBntRErBfpogdwlbIrLt0UIy
 Nt+2w/7XnqR2jKhaGmcXML03TzXu3dMFJrm21ey8YkQIcfjpXWCZV5EUPoJc7KupfQJa
 8laA==
X-Gm-Message-State: AOAM531SvhMSGpsvcQXyFN8xMn+kbR3inbAYUIEOwWMFD2dzRWAIB+8E
 LHRjp/+WePqBg2AS1NBFPufdAw==
X-Google-Smtp-Source: ABdhPJwkAPUvBSZdcb/nL6aB0MjdVk1fyvXJt48NlnjWwhdimKgZApVM4QC+1eYlliVzyYFFxpbe6Q==
X-Received: by 2002:a0c:ab16:: with SMTP id h22mr6078832qvb.72.1596231675563; 
 Fri, 31 Jul 2020 14:41:15 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c61-18ee-3919-a84c-b555.inf6.spectrum.com.
 [2606:a000:1401:8c61:18ee:3919:a84c:b555])
 by smtp.gmail.com with ESMTPSA id s33sm11112205qtk.11.2020.07.31.14.41.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 31 Jul 2020 14:41:14 -0700 (PDT)
Date: Fri, 31 Jul 2020 17:41:12 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200731214112.GZ6965@bill-the-cat>
References: <20200728095128.2363-1-patrick.delaunay@st.com>
 <20200728095128.2363-6-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200728095128.2363-6-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, Wolfgang Denk <wd@denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>, Simon Glass <sjg@chromium.org>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v4 05/14] env: nowhere: add .load ops
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
Content-Type: multipart/mixed; boundary="===============2546480641241578024=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2546480641241578024==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i4PQY6bUD8mHTt/C"
Content-Disposition: inline


--i4PQY6bUD8mHTt/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2020 at 11:51:18AM +0200, Patrick Delaunay wrote:

> Add the ops .load for nowhere ENV backend to load the
> default environment.
>=20
> This ops is needed for the command 'env load'
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--i4PQY6bUD8mHTt/C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8kj/gACgkQFHw5/5Y0
tyyTJgwAqmiXuwu50UWfBIC9aSa1BrQI/NBDWeyMSEFdoB5BW/3VEYVZ9kEEUUbP
bk3N1EOaQAXrRbRhUagPCKFMYmbRTnLwatBsH6dF4OUIt9mmgwBF+2xLlrC+euys
3Lr+UXXF1Bfv2Dz/kiGT2OK+XUK8xK7nDaQXinhc+bFktKZvXO4DnRhckm4f045T
lYRnt0krDZfChFJLO2/EcucaQcX+ybyuOXLdoe1QGzZiC1ax/ttmkIQt79SyQKsv
o32YEvaDMsyzybcBBoIie2LLYXlS37pM3tjiUVr9/vyBBwpYoJ/M0cOkk5nx6Ocn
3/h3CR1I/p1702TOtIrTI3pDcCn5w3yJX04TR+Sn2HeQbe6k49GyUwFhzoUNjwXL
oDkMVuYFFummupnkA4sq51ZUHnnd5GHaJiHZUVOv46aIJg84bJWc0r9nRc6WGTHC
fhcS3qpOFuEGkR5ITeNyJLbJlkrS4myNus3dgjPZe+DJHXRGB4SUbS6QwNASpky7
4rxmF+2a
=ISUf
-----END PGP SIGNATURE-----

--i4PQY6bUD8mHTt/C--

--===============2546480641241578024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2546480641241578024==--
