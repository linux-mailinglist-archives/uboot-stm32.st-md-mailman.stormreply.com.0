Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C82278729D
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Aug 2023 16:55:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E78A2C6B44F;
	Thu, 24 Aug 2023 14:55:53 +0000 (UTC)
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0D7BC6A61A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 14:55:53 +0000 (UTC)
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id BDAB330A;
 Thu, 24 Aug 2023 16:55:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2022082101; t=1692888952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p1D+TVsNqKCuLpBY/Car4bHZCl3xd6V0XKxLVKgWlhc=;
 b=PfIFWDer9nQgfhct64zDzzWOCQl5YM7xsTjguwqPt7o5q3dZajlhqiFli10iBS0TR41IFb
 sVUwMGDfj7RYSS+W2OnqxHryghtGq7Ngo6Ky5HycBt6nAfXq6IbsNJRCUJGpSdfWq5Hzny
 XPJqCuQgpQiTrM2afg8njN9nZ+oC7a7OqIjNR3LEW6vdmGnqUU/N8zmcg+pc40G8jGyh/y
 EEUPRI+1f4sIcufWz4N9R1F2HIhzolB4pQPwtrmZfmRezla7UT1SYuPOWeA00HboRSigx2
 fXuqxNy0h1yGKul84N14Y6QOjrRksAsiOF9Oy3GfHh/zW7bV29aWzEVlpxC4Ug==
MIME-Version: 1.0
Date: Thu, 24 Aug 2023 16:55:52 +0200
From: Michael Walle <michael@walle.cc>
To: Simon Glass <sjg@chromium.org>
In-Reply-To: <CAPnjgZ0MNb5aAtmz9Yk+JiHxQt+qwhQW=WccgiiRRqfQ-a1OBQ@mail.gmail.com>
References: <20230824030304.1555547-1-sjg@chromium.org>
 <9f4019b9e46d3fae5bbfad6d06ff6bf9@walle.cc>
 <CAPnjgZ0MNb5aAtmz9Yk+JiHxQt+qwhQW=WccgiiRRqfQ-a1OBQ@mail.gmail.com>
Message-ID: <6cb6ee52ccd550d3c8fddd76bc84a282@walle.cc>
X-Sender: michael@walle.cc
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Peng Fan <peng.fan@nxp.com>, Philippe Reynes <philippe.reynes@softathome.com>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
 Jonas Karlman <jonas@kwiboo.se>, Neha Malcom Francis <n-francis@ti.com>,
 Vikas Manocha <vikas.manocha@st.com>, Ivan Mikhaylov <fr0st61te@gmail.com>,
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

>> > This series adjusts binman to enforce just 4 extensions for output
>> > images:
>> >
>> >    .bin
>> >    .rom
>> >    .itb
>> >    .img
>> >
>> > Other extensions will produce an error. With this rule observed,
>> > buildman
>> > can keep the required files.
>> 
>> How does this work? I didn't get all the patches from this series, 
>> which
>> makes
>> it really hard to review or ack the individual patches.
>> 
>> Are we just whitelisting any files with these extension? Honestly, 
>> this
>> sounds like an arbitrary restriction to me. But maybe I'm missing some
>> context.
> 
> You can see the full series here:
> 
> https://patchwork.ozlabs.org/project/uboot/list/?series=370121

I know the archives/patchwork. All I was saying is that sending just 
parts
of a patch series to specific ppl doesn't make any sense, because you 
always
miss the context and for that you have to look at the archives.

-michael
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
