Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4B4786ADD
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Aug 2023 10:58:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC9BEC6B44C;
	Thu, 24 Aug 2023 08:58:30 +0000 (UTC)
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF566C65E56
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 07:32:41 +0000 (UTC)
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id 11E695E7;
 Thu, 24 Aug 2023 09:32:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2022082101; t=1692862361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xN8xQlNeGD7nuT2802weXMRaPuWF7/QzkZS29QGXJkQ=;
 b=HlkOIMokqqjvSm1/CuSU7m0/pb2na4THEoRH9P75RDwoLHJ4/wjkI6njoksIwN9Dgbj+m0
 8n2ydcHNGGn1vUzcMDuohMt9Aw7GOepIq0lczl7RwZm4A989dv8Kmvv7m4q9XMj+YK98fj
 c3yQVbDdMMA6nv2+uAF8tNJwbE8/rC7K/tEGD2DKY3IdrjRMvQ+tG7BzzF+mSfln/8t5Ym
 PeYLk8Wdnq76WtFiDH98AbDEUSg+CozRrIMdJPmgocQrkPXc+jKWcmy2VxQpJNex3svZYc
 yStmQ8T5W0OixbnEiuRcogHMmoV9TNWe7ovrYpuH6LWSmeQuEZHdFavxPfTFSA==
MIME-Version: 1.0
Date: Thu, 24 Aug 2023 09:32:40 +0200
From: Michael Walle <michael@walle.cc>
To: Simon Glass <sjg@chromium.org>
In-Reply-To: <20230824030304.1555547-1-sjg@chromium.org>
References: <20230824030304.1555547-1-sjg@chromium.org>
Message-ID: <9f4019b9e46d3fae5bbfad6d06ff6bf9@walle.cc>
X-Sender: michael@walle.cc
X-Mailman-Approved-At: Thu, 24 Aug 2023 08:58:29 +0000
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Peng Fan <peng.fan@nxp.com>, Philippe Reynes <philippe.reynes@softathome.com>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
 Jonas Karlman <jonas@kwiboo.se>, Simon Glass <sjg@chromium.org>,
 Neha Malcom Francis <n-francis@ti.com>, Vikas Manocha <vikas.manocha@st.com>,
 Ivan Mikhaylov <fr0st61te@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@dh-electronics.com,
 uboot-stm32@st-md-mailman.stormreply.com, Kamil Lulko <kamil.lulko@gmail.com>,
 Dillon Min <dillon.minfei@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 0/6] Attempt to enforce standard
 extensions for build output
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

> This series adjusts binman to enforce just 4 extensions for output 
> images:
> 
>    .bin
>    .rom
>    .itb
>    .img
> 
> Other extensions will produce an error. With this rule observed, 
> buildman
> can keep the required files.

How does this work? I didn't get all the patches from this series, which 
makes
it really hard to review or ack the individual patches.

Are we just whitelisting any files with these extension? Honestly, this
sounds like an arbitrary restriction to me. But maybe I'm missing some
context.

-michael
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
