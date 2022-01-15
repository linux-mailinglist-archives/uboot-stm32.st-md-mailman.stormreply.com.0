Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2670A48F601
	for <lists+uboot-stm32@lfdr.de>; Sat, 15 Jan 2022 09:45:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF1F9C60461;
	Sat, 15 Jan 2022 08:45:12 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02E21C5A4FD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Jan 2022 08:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642236308;
 bh=9e/IIekY/Fw45NSizaaQPEIvcwGnxOy4Mkqnp/HY1iw=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=M7v9fsuMyr+3dhCJugcgXI3WMUYugMRxsYgE/6OT66xM7xISGLZPoqRW/rh6kuNUX
 bYqTr/DLVa0h8Ki3xQ4VS0ZUEZcN8FOfSk06DTcrVW9lKuPzFNjvw0M/jWAzp20VLP
 4r/KGEtY+Zrz8XSg1Wa3nCbJxeNZ+Wu4yDII3QfI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.94] ([88.152.144.107]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MdefD-1mZaqb1tVh-00ZfVw; Sat, 15
 Jan 2022 09:45:08 +0100
Message-ID: <9bb910ab-0d21-3fff-78c5-633c6ba08a29@gmx.de>
Date: Sat, 15 Jan 2022 09:45:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20220112105327.1.I74f7b02a4d65313e46a505e7c371c3691701a0f9@changeid>
 <20220112105327.2.If9a3d60d774b6205ab356990d2f9437e97afe0b1@changeid>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
In-Reply-To: <20220112105327.2.If9a3d60d774b6205ab356990d2f9437e97afe0b1@changeid>
X-Provags-ID: V03:K1:DIOo7o36ToAd70gCWnfVotxflt0np9vLIQMzqlswMqwGwlHCd9z
 MqmgTt/a6+WBXwZm+3qeRkrA3833yJku6nQ5Twun2rV6GwllKh24mBU0UDfUxtS+k+Xrlm3
 BjxTvIpOOn0+yf264/mh5SlfY0lrm62y2oB7IK6nL525PvwPApCSFLzFLi8Y5YbX4AHqKUw
 WJ5N9ESyvGEVwtNLiSPIg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HWp0n4YfZ5Q=:TaCsVSxBB/XH5Co4l755D1
 9rcnKLa+CPnKnBMC/ytbaSeF5Sj52eJ5a12fpqfv6TyOguIR9ZXzShbUR1GvKgJf1xAbMfHmO
 lhN22jJWHMWPj1x05yd7fjS5voP5vOERwDHgqx4yoRuhjVnTdkseYG6rIhmk8iR0BPlFwsjfS
 gP4ufvDVZPs8OoVcKFaCockIeMVkDocmTzXuOyFSuyYj5XH8mJbxhNtm8Ntkcx4Wf8HFObkik
 aj3hLW/QEHd9/GDOz8gLNklgp4pGxkokzo8fpn0CiHZbCus8Melp2BvP0c50l/ITKfx1996h+
 wbdMvN65jnWOodBvyVIksApbzOz6ke9xedJRYa1tjJR4XfXoqzrLvdgUsjjgj9asqVvC/GgM8
 Kh6Q+XsWT59aIQThoAGoWTiYCRi4eIa7CRCoZnR2I7Zae8fjPex/mX870KLxrZZHxtQmReD2S
 5V+LP8pFYFXBGks3mj76z60Eyl8w4ZjvMYwCFC4IAr8YBcfBQUi/oxT/5cSK4Nd4WxIAvDggP
 My+VESyOf2WWCn+JMmyI84884vWcLkE0hA9WsxiRAiUiI2VUkfsy+E3VQ5+vzDrxWbLRqPKNH
 JHvoXLx9Yt8ZdYIfrVoIZiExsO57N6An1H/TXle9wblEy4BZ5HrEcTBp+ALP41nQVurTiaLKl
 7ePTtaswStHrgew32ZjV36DbfkK4kubKOGHHObqHfcuCBh+L1jVLafRR7huZ1sv+xdVO4jWbC
 fQIsqtMy2hz5JU9wSAS4wAiYrWIj+S7Bb4d7co9khNNArqLqAkZ5ituZd+B3E3uBoYyqwGhCG
 ymxreRXchjdtKtzDSuNtplhY6jNRQFFlHDj0kuk/rdlLOsnxIhv4dMQL5+BPJ0Fhi0RirQfrV
 uz6QV3CbaI+LJD9rs3z0cnlp3KFQIohPnD7xMmWMtfnocADHScbLUmJp115SBnXgDoSY44jXv
 Ug9AUVAvbYpIlPgS5mP5IX4PAAiCPObZpqgq/5xTXNh6eGamTJM64HX7MqzrFFr0E2+jiq5/+
 vPRu/k1GSA7cGpK3rzOjwStGcoJAzuvTQDR9w4cC37jjd3fNo7BWF5M5m0ZIcd3GN4d0tPJhF
 sntlgRS0C0wfZQ=
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 2/9] doc: add include/dm/root.h to the
	HTML documentation
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

On 1/12/22 10:53, Patrick Delaunay wrote:
> Correct Sphinx style comments in include/dm/devres.h
> and add the associated driver model API to the HTML documentation.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Reviewed-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
