Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD651AE741
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 23:08:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76BE6C36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 21:08:44 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6B85C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 21:08:42 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id b62so4001130qkf.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 14:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ootC+/ps9QpKgSsOJc3LvFUclkb1jrqHKxDMVasdHT4=;
 b=ZhydPZWDzbla0Fy8qd7v62rRl0RAOdMPSwdLZjaPpUmrrZQRpr6boys6APMr9s2JXl
 kFQS1pQIrR5zQiqDXkdDkm5JGNtPHhc0afIPvTdFDhwh0Zuz8gb2Cds8leRrVE9i9Ec3
 /M+MdcBlUQYT0KIKlv4smZmKLxOZeMheQQdWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ootC+/ps9QpKgSsOJc3LvFUclkb1jrqHKxDMVasdHT4=;
 b=ZdtJLKD1BZfRpd/uxgnaWLfbYh0SK4AL5CGNy5qFfcXLgZBaYE7kErNHSmU+LHX+Fn
 FJMURD8SGZhVpFstMq9Bs/3vSYHr1DDjfv4v9CEijnEosS4ckHRagPzskkQuE2JEL1Tn
 MzT+SDhzt7wMHIkh6y6oFhntVtldrZ/+g/9OVIkmKh41Iv2Rmdq7u908rzVOPvYTB0rw
 X54NBHYDb9Igvri3JPY7h6xjIvFPvh6cOx4cJl7qPTuhbd17Q0h8l4c7+RHmBl/n0BhN
 S5+RUBEALnpfBzs5ORU2IOniVxK6j/EgtHi7VW8VINOqCiJnr5SXSFOjDBCl4AG5FTGk
 /WrQ==
X-Gm-Message-State: AGi0PuYtj3EfZsKyjiotUAG0pKARZnWYg2O+tjuGBfjjTk0a7Aavgryo
 /VAH1lBypdHUV2yACMtuxBgOJGQrOfg=
X-Google-Smtp-Source: APiQypJWyZYYdF6K+tTmeQRIwYHnFAEYJKUL9XeolU8shjw0Cd7FXCh+mj+jcgGy1Nq1w2G/Aym5eQ==
X-Received: by 2002:a37:48c7:: with SMTP id v190mr5234140qka.46.1587157721790; 
 Fri, 17 Apr 2020 14:08:41 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-4058-2b78-ede2-0695.inf6.spectrum.com.
 [2606:a000:1401:826f:4058:2b78:ede2:695])
 by smtp.gmail.com with ESMTPSA id v184sm418257qkd.52.2020.04.17.14.08.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Apr 2020 14:08:40 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:08:38 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200417210838.GK4555@bill-the-cat>
References: <20200310091505.24862-1-patrick.delaunay@st.com>
 <20200310091505.24862-3-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200310091505.24862-3-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Stephen Warren <swarren@nvidia.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Patrice Chotard <patrice.chotard@st.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH v4 2/4] Revert "stm32mp1: remove the imply
	BOOTSTAGE"
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
Content-Type: multipart/mixed; boundary="===============4978763679115964835=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4978763679115964835==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oPYnW2SrAqZUvu4n"
Content-Disposition: inline


--oPYnW2SrAqZUvu4n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 10:15:03AM +0100, Patrick Delaunay wrote:

> This reverts the workaround introduced by the
> commit 16fec9b0bc1a ("stm32mp1: remove the imply BOOTSTAGE")
> As the bootstage alignment issue is now solved.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--oPYnW2SrAqZUvu4n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6aGtYACgkQFHw5/5Y0
tyzChAwAgYiNpbNnCew3gX89z0cCeG3BLP0QMXom+1QrwF3p3NAFkWPknDGirjjk
9rWbo1MOP/LHDKeSog4437HQCcT3vdM1fKToL61xYxX8tmogi++Ee3SFYL3PUYdx
ruuvVsxw7ruzewCpZ5iobYI1VjhyuYfed5kB7s04S6a/tyRpe1GgxFf1I3DukfOI
UWYD/PBDJvfeoyaXVPz8apdE35evlbQzAzV9ffh9CeDO/aBg2nmrW39gDH79Tf6D
y05Ye6vHSIn1cPN3EiiPD/LmTMvXj5oRX9D52ojCNegFb2PddskTnwsqk6V1GfoU
mgmX28bhVdd/s1Ahu+6PmCDCozrp4HsjCk1Eo4J34zjrHw/3NohdISISvAisnk1Q
Ed3EVE99CfCkkDeKh07md0JQNE72Os9erg89O/xl7mOUSxg+OiB6HIO+4zeq5wAn
NGpfhb8lMRqn+xQqwGFYS5Rpkrqtch9uHm9V9w7XHMs0n+ogz0FOkLVUAsXC+5MV
oyKAlXa8
=FTD2
-----END PGP SIGNATURE-----

--oPYnW2SrAqZUvu4n--

--===============4978763679115964835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4978763679115964835==--
