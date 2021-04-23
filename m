Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC44C3696D6
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 Apr 2021 18:24:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9F45C57B5A;
	Fri, 23 Apr 2021 16:24:15 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80F35C57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Apr 2021 16:24:14 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id d1so12465958qvy.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Apr 2021 09:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TDYwno0L0tVoGunYf8HRpqKlkCrLL3rYRC9IML81PX0=;
 b=duD414t/4Yrw45xjpSzlgm+3yGdyF39Ym5pPEGDQE/EmH9odtaN0s9GEN6KA+L9aIm
 5eVAFiryh2AqbX75M7CNOJX9bHCN3GTi9kXODcmWTykIwkJlqBhZFoiCdDJkWAVzU2tH
 s5yle2DFzk7KjLzL4LFYC2LJ5Vexq9n49TZIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TDYwno0L0tVoGunYf8HRpqKlkCrLL3rYRC9IML81PX0=;
 b=SDaqE9okQOjT1jUgTQOJCrHu86WqR8t4k3nmkm5Jo6TM48KBD7Vn+FPWjau4TvvQoQ
 Gqcmgp39fUn6hKQCqcKZvSEE+YkYmXp+foapbKR+E0fJGn6eIdubCU2lPMKY047WxbpN
 UJ03KkKVZKxfmfh+6OdtBYyO/0UGrVDFWonZPQE9YBQKgK/On/TlGRM7uDU9u+mkF7it
 udYx0NMqzF1F2Cx7iYpnTPYNjKMS6e7KuMndoENFFAwNbUZrVEhTU8DbtV+4zkdGIai7
 y2p7kl6LnH0fWoNWPzu8SjdFp5ZcTUM1qD9hfIZQ76ctk/TygTCAV3UVAFGI3ig9FMtp
 tJkg==
X-Gm-Message-State: AOAM533eOCZ07FYXlPvZEdYvuWfYM+ianxxjWDV0jn+X57CZ8+G3susO
 bR+FK3HtZ/8tD1ZDeP2yGAcwyA==
X-Google-Smtp-Source: ABdhPJymhhm6zUenp9g+nQDUAnCA84y1k2d4ylo83QoMKgLKjZOwr9XUdeprNvUs5M5w7HKvBw7atg==
X-Received: by 2002:a0c:9a04:: with SMTP id p4mr5282839qvd.60.1619195053443;
 Fri, 23 Apr 2021 09:24:13 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-140-239.ec.res.rr.com.
 [65.184.140.239])
 by smtp.gmail.com with ESMTPSA id r125sm4574192qkf.24.2021.04.23.09.24.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 23 Apr 2021 09:24:12 -0700 (PDT)
Date: Fri, 23 Apr 2021 12:24:11 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210423162411.GS1310@bill-the-cat>
References: <20210310091632.17103-1-patrick.delaunay@foss.st.com>
 <20210310101622.v2.6.Id37d7acc114d58f6c20cfb3200846bdec196a740@changeid>
MIME-Version: 1.0
In-Reply-To: <20210310101622.v2.6.Id37d7acc114d58f6c20cfb3200846bdec196a740@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH v2 6/8] test: lmb: add test for overflow
 protection in lmb_add_region
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
Content-Type: multipart/mixed; boundary="===============7231039233645946674=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7231039233645946674==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G8KvhGvoMBxI+G4Z"
Content-Disposition: inline


--G8KvhGvoMBxI+G4Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 10, 2021 at 10:16:30AM +0100, Patrick Delaunay wrote:

> Add test for max number of memory regions and in reserved regions.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--G8KvhGvoMBxI+G4Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmCC9KoACgkQFHw5/5Y0
tyxxgQv/XzjvSd/NoNlaPzHV50wtZu9KJTNgFDvuJCRoynalunMRVXPPOK+xFA5X
OWkMPqzLFw2Vic/50B3fO2WK6xJ4xuhkq5B3I2xglaoDWRYk8RCVvd0m2Ald9gVm
2vU0+7l2w/+tIrX0fgcKKOkE2hZr9yfIoFhJ+Lqi0wV2UDFnCjEYpNHI/f9Hg84l
DfRYDOWaFJ0duAz22uH5Df5oWj5UjZm93KWUde4foJG2F2bxSeFkBQG6yVxg5sbs
oAGnssqcwCZN7wWW1Vl/qsQWLe7UPwq0QAbl4Wl+fd14d1CyDe3sG+NDiA/NRLlu
yW05ECNpnargn+VwvvO9MXwIEBZxzR3jfaXDZKp7PdvU3q0cH1sq5g5nLsd0+G9K
Cmg0ruMdW64LDOW2kZf8KV2BzF84dh2EzfbcDyOILcx8ohHqXK8kjC0spgLYs+My
SVidgexTQt87/vSDluGcLmRE/rOfnkAHEjKC2b8+/H1J8w0aSZNwxMfbR0yxAdhE
IW9FArIr
=z0Pr
-----END PGP SIGNATURE-----

--G8KvhGvoMBxI+G4Z--

--===============7231039233645946674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7231039233645946674==--
