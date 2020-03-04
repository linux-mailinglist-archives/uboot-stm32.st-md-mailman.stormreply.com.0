Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E1F179967
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Mar 2020 20:59:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF2DEC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Mar 2020 19:59:18 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1E81C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Mar 2020 19:59:16 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a5so3604038wmb.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Mar 2020 11:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VkOdJw4hioZOXbgvjJlj4vH2pL0VnaHzvb30CizoRvQ=;
 b=SQjal2276BD8P++qzcCNMbMAWkQ9X2NDTZGo600j707xwAhnl9nS6bK6kktHQ8caD1
 N1I52R5mWYEGmboU06sW1v5TTID3IzinWxkPJVhItqDEcqhs0XjeKgZseX1Pq4RX9+Cb
 D1N4bkxIkkuNCk3QCZgTmvtA/cPl52oL7Qy2idGNeNzqHa1wa+LSpGjHOZtQ+iSf6eB0
 auFt5FLFoqTB+VEaMerhMnD1dB4++DFM/ChSAl0aiCQBkIuKWdYCTnZ1Nm9HamIiF0Td
 HhkYIkwJT6HepRTZ1tgOl2CXN7TOQwfdTs8Fgl2c60uv2N+yU8oayDHsjWPT/iALw/Vw
 D6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VkOdJw4hioZOXbgvjJlj4vH2pL0VnaHzvb30CizoRvQ=;
 b=YOS0xhdksp/Olut2ZiRaTZqUhsuIdnDI1nSb7blDDEhxlXIXA4Sgqd4Jwze0+9Ull3
 Av4Qv6ciNELb91aW5aFGa8SUlOpVA7hHG8XWOnVdhdPX7SCo0KzzBtON1GUSHJZQ7O0i
 V6W7KtCNVAc7fQJ/xo6AjlK6rfAAww3vkh/qb4sr8zmndYTPzvLm8/W2523iZ0X+eBy1
 IEbNIhccTTmKJHFqxamCOovyyRFwrzq5nhel2r1/kpjd+sl8VSVaScX6deb2hziwgNUz
 WvxetstGKtP54XYHY76Fb8d3n0a/G3NgXFKgZ3VnW+9BTRsOjIYvQvtVZLMQH0T/jYgH
 6fEw==
X-Gm-Message-State: ANhLgQ2YAarY+VsfgTcYVQ44DI//a81ybq5/dovwpfwL8y7tRS4zHVXZ
 z32i3Qp9U7o4ct3R6u1631QgjAg2
X-Google-Smtp-Source: ADFU+vszOUOpDPn9p9xEPyb88Cd+Fw+30QANR3zOdE0Yh7BJvmHhKL7Q+yjahdC2qSuJh/ApZHTTVA==
X-Received: by 2002:a7b:cbcf:: with SMTP id n15mr5089556wmi.21.1583351955957; 
 Wed, 04 Mar 2020 11:59:15 -0800 (PST)
Received: from ?IPv6:2a02:8071:6cd:f600:3dff:b879:b41b:fa13?
 ([2a02:8071:6cd:f600:3dff:b879:b41b:fa13])
 by smtp.gmail.com with ESMTPSA id l4sm42781636wrv.22.2020.03.04.11.59.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2020 11:59:15 -0800 (PST)
From: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
To: Marek Vasut <marex@denx.de>
References: <20200218083503.5468-1-patrick.delaunay@st.com>
 <6ca7cd1f-c86e-aa38-adf8-8b9ee3f56dd8@denx.de>
 <CAAh8qsy6yDHsUu3Mv=Oma0SMn9QLdNVLjQHF-yTugmB4_fahRA@mail.gmail.com>
Message-ID: <707ed60a-a54a-458c-ec2b-1b77301d94f5@gmail.com>
Date: Wed, 4 Mar 2020 20:58:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAAh8qsy6yDHsUu3Mv=Oma0SMn9QLdNVLjQHF-yTugmB4_fahRA@mail.gmail.com>
Content-Language: en-US
Cc: Peng Fan <peng.fan@nxp.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Simon Glass <sjg@chromium.org>, Sekhar Nori <nsekhar@ti.com>,
 Lukasz Majewski <lukma@denx.de>, Ley Foon Tan <ley.foon.tan@intel.com>,
 b.galvani@gmail.com, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Michal Suchanek <msuchanek@suse.de>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH v4 0/5] usb: host: dwc2: use driver model
 for PHY and CLOCK
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

Am 19.02.2020 um 08:27 schrieb Simon Goldschmidt:
> On Tue, Feb 18, 2020 at 6:53 PM Marek Vasut <marex@denx.de> wrote:
>>
>> On 2/18/20 9:34 AM, Patrick Delaunay wrote:
>>>
>>> In this serie I update the DWC2 host driver to use the device tree
>>> information and the associated PHY and CLOCK drivers when they are
>>> availables.
>>>
>>> The V4 is rebased on latest master (v2020.04-rc2).
>>> CI-Tavis build is OK:
>>>     https://travis-ci.org/patrickdelaunay/u-boot/builds/651479714
>>>
>>> NB: CI-Travis build was OK for all target after V3:
>>>     https://travis-ci.org/patrickdelaunay/u-boot/builds/609496187
>>>     As in V2, I cause the warnings for some boards:
>>>     drivers/usb/host/built-in.o: In function `dwc2_usb_remove':
>>>     drivers/usb/host/dwc2.c:1441: undefined reference to `clk_disable_bulk'
>>>
>>> I test this serie on stm32mp157c-ev1 board, with PHY and CLK
>>> support
>>>
>>> The U-CLASS are provided by:
>>> - PHY by USBPHYC driver = ./drivers/phy/phy-stm32-usbphyc.c
>>> - CLOCK by RCC clock driver = drivers/clk/clk_stm32mp1.c
>>> - RESET by RCC reset driver = drivers/reset/stm32-reset.c
>>>
>>> And I activate the configuration
>>> +CONFIG_USB_DWC2=y
>>
>> Simon, can you test this on SOCFPGA ?
> 
> I can test if it probes, but I don't have anything running on that USB port
> the socfpga_socrates board has. Would that be enought to test?

Tested the whole series on socfpga_socrates by instantiating the driver.
Shows the same behaviour as before (I still have no OTG cable to test
attaching a storage device).

Regards,
Simon

> 
> Regards,
> Simon
> 
>>
>> [...]

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
