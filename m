Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D915BF67A
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Sep 2022 08:39:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0B29C0D2BF;
	Wed, 21 Sep 2022 06:39:19 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69A31C03FC4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Sep 2022 21:28:41 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id A70DD3520668; Tue, 20 Sep 2022 23:28:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1663709320; bh=/HATVddV8K+35wKIM8Slmw/BTlO+npWcmg/A4HS9Xi0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NZHnogS660i8rJI301qPqCGWlJxs27T0+CHMaQFwQW/2lEXNa6cfMqIS8RI5LjBlB
 ChqDwYxx8/SNkuLJdMMuQrNeXB/+ipgkr3gWB3Jv3HdWV3FOBAndxdy8svfx0c5uOS
 vR6kmP8XsrT3ONTk53gmdEGaTkjyLFlubmE8iOHQjAld2qBbwJ37N1u+/nTVW005SM
 I26O/d7bes9x4teAxc1q1JzPJxf7ZS9ue9uSdhnRbOtJPqtsVpU89vAztre7Soo4im
 V1YMN6LvqaIm8+5sD8l8rnc4x4rVbSrD1EBIxhe9/pV5fR6WxJsvhgmdvUMBRm686+
 aqJ2BF26z0+aw==
Date: Tue, 20 Sep 2022 23:28:40 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <YyowiHK08afNagsS@waldemar-brodkorb.de>
References: <20220920160436.117811-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220920160436.117811-1-patrice.chotard@foss.st.com>
X-Operating-System: Linux 5.10.0-18-amd64 x86_64
X-Mailman-Approved-At: Wed, 21 Sep 2022 06:39:19 +0000
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 0/7] SPL fixes for STM32F7 MCUs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Patrice,
Patrice Chotard wrote,

> 
> This series is fixing issues in SPL boot mode:
>    - SPL binary size over 0x8000 bytes for STM32F746-disco, STM32F769-DISCO and STM32746G-EVAL boards
>    - fix embedded flash size for STM32F769-DISCO
>    - fix CONFIG_SYS_SPL_ARGS_ADDR for STM32F746-DISCO and STM32746G-EVAL
> 
> Changes in v2:
>   - Remove SYS_UBOOT_FLAG from stm32f746-disco.h

I tested this series and all is working fine now. Both defconfigs
and with or without Falcon mode. Thanks.

Tested-by: Waldemar Brodkorb <wbx@openadk.org>

best regards
 Waldemar
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
