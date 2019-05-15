Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BCB1F9AC
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 May 2019 20:01:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 580D6C35E02
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 May 2019 18:01:27 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DC8CC36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 May 2019 18:01:26 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w8so493270wrl.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 May 2019 11:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rQP9fmYesOogoJEowzGedDy9vT2sWmq7MSVBu/8mRJA=;
 b=XCVa1WBTlHqA377WNhXG1a9G7iu500Q/3MWO5N5qafdvAA50uQk/3uPtU+v+hS5gw6
 rcpHne8hHEE/Guc9Grv+w2G693txWBCvlisjzkzHVvecHc2MxO2j8jXB24DeIYmYZeqP
 eAAhSCsNHoQwy9a9dEVEa4DHKWUEgE3CPlZFz+oCZe5dh3Jmkmn43awbVN87nkJtD4VQ
 3cERrgtaR6IS1IqIlrde1Qoi2JTCRCSUqX4awbpxAJOn8DKnK72sY/QWFfKJUBuZqSvL
 OLDQVI4S2HTEQkulo/PYrCrDMyi4D6g1pGHjmqld3R81qIC/gljV1SxH+54enQAn9e4G
 3drQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rQP9fmYesOogoJEowzGedDy9vT2sWmq7MSVBu/8mRJA=;
 b=cMyezjMkbC8rhYWFdgTAS3TgILxER29Qqg3VQmIvNNEgJ4rHOZ7vU7x5A18hkpUJVo
 wk+QJDxRbY0cEel6YrO0ePElDyp617yFAU5FrT932St6eAx3KkCQUbBvr/xYmbG7W5lP
 JZw4ptsG054uwaZ8sLSRJcuVgSOXgpgHEMswBwyyfFS6Qy2F71oELc7M/D1PdDsDjCdN
 v3qbTfQ/Etit8JIJ1MV/Btbl96boKVoKF+ih1BeJHNdP+j8kbCk9LjoeJ/QBKI3yhTCh
 tJeIs4aeR8wvlLOpayGWkJGJYNoa3INAkaAKeswe41HcVdIgTwzwHns35s8kmZZ0QgHj
 Xd7w==
X-Gm-Message-State: APjAAAW3OVHvDkTlU6QxYn20mbLOcLXRLGGFAWzMEjdOYVWXU5POmdiG
 hwa4IMSkMQG6sEJMy85cvDc=
X-Google-Smtp-Source: APXvYqzrMbjHLA97joploMkNdOK0W4QwtG/O/unzA0As+4dmj1JL2GTjQwS4RrLe9x9L5sLwBfe2HQ==
X-Received: by 2002:a5d:54d1:: with SMTP id x17mr8278393wrv.207.1557943286044; 
 Wed, 15 May 2019 11:01:26 -0700 (PDT)
Received: from ?IPv6:2a02:8071:6a3:700:484e:b84e:2cd2:80c0?
 ([2a02:8071:6a3:700:484e:b84e:2cd2:80c0])
 by smtp.gmail.com with ESMTPSA id a6sm2564634wrp.49.2019.05.15.11.01.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 May 2019 11:01:24 -0700 (PDT)
To: Patrick DELAUNAY <patrick.delaunay@st.com>, Tom Rini
 <trini@konsulko.com>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
References: <20190504200356.22099-1-simon.k.r.goldschmidt@gmail.com>
 <38fbbbb86a434890951f03af3cfbb467@SFHDAG6NODE3.st.com>
From: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
Message-ID: <df780fde-8b7a-c23b-0495-ca87dca359b3@gmail.com>
Date: Wed, 15 May 2019 20:00:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <38fbbbb86a434890951f03af3cfbb467@SFHDAG6NODE3.st.com>
Content-Language: en-US
Cc: Peng Fan <peng.fan@nxp.com>, Christophe KERELLO <christophe.kerello@st.com>,
 Vignesh R <vigneshr@ti.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Kever Yang <kever.yang@rock-chips.com>,
 Alex Kiernan <alex.kiernan@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Sjoerd Simons <sjoerd.simons@collabora.co.uk>,
 Klaus Goger <klaus.goger@theobroma-systems.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Fabio Estevam <festevam@gmail.com>, Ruchika Gupta <ruchika.gupta@nxp.com>,
 Qiang Zhao <qiang.zhao@nxp.com>, Marek Vasut <marex@denx.de>,
 Tien Fong Chee <tien.fong.chee@intel.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Abel Vesa <abel.vesa@nxp.com>, Sumit Garg <sumit.garg@nxp.com>,
 Jagan Teki <jagan@openedev.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 Michal Simek <michal.simek@xilinx.com>, Ley Foon Tan <ley.foon.tan@intel.com>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
 Lokesh Vutla <lokeshvutla@ti.com>, Stefano Babic <sbabic@denx.de>,
 Shengzhou Liu <Shengzhou.Liu@nxp.com>, Jean-Jacques Hiblot <jjhiblot@ti.com>,
 York Sun <york.sun@nxp.com>,
 Siva Durga Prasad Paladugu <siva.durga.paladugu@xilinx.com>,
 Peter Robinson <pbrobinson@gmail.com>,
 Otavio Salvador <otavio@ossystems.com.br>,
 Rajesh Bhagat <rajesh.bhagat@nxp.com>, Alison Wang <alison.wang@nxp.com>,
 Mian Yousaf Kaukab <ykaukab@suse.de>, Ashish Kumar <ashish.kumar@nxp.com>,
 Jeremy Gebben <jgebben@sweptlaser.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Adam Ford <aford173@gmail.com>,
 Mingkai Hu <mingkai.hu@nxp.com>, Albert Aribaud <albert.u.boot@aribaud.net>,
 Bin Meng <bmeng.cn@gmail.com>, Joe Hershberger <joe.hershberger@ni.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Po Liu <po.liu@nxp.com>,
 Patrice CHOTARD <patrice.chotard@st.com>, "Andrew F. Davis" <afd@ti.com>,
 Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 Mario Six <mario.six@gdsys.cc>, Lukasz Majewski <lukma@denx.de>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 "Marty E. Plummer" <hanetzer@startmail.com>, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH] spl: kconfig: separate sysreset and
 firmware drivers from misc
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

Am 15.05.2019 um 18:19 schrieb Patrick DELAUNAY:
> Hi Simon
> 
>>
>> This adds separate kconfig options for drivers/sysreset and
>> drivers/firmware.
>>
>> Up to now, CONFIG_SPL_DRIVERS_MISC_SUPPORT added drivers/misc to SPL
>> build but also added drivers/firmware and drivers/sysreset at the same
>> time.
>>
>> Since that is confusing, this patch adds CONFIG_SPL_SYSRESET_SUPPORT
>> for
>> drivers/sysreset and CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT for
>> drivers/firmware (and accordingly for the TPL options).
>>
>> To keep the binaries unchanged, this patch enables the 2 new options
>> on all boards where DRIVERS_MISC_SUPPORT has been enabled before.
>>
>> Signed-off-by: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
> 
> I have one compilation failed for one board (on latest master branch)
> 
>         arm:  +   stm32f746-disco
> +drivers/built-in.o: In function `do_reset':
> +drivers/sysreset/sysreset-uclass.c:113: multiple definition of `do_reset'
> +arch/arm/lib/built-in.o:arch/arm/lib/reset.c:30: first defined here
> +drivers/built-in.o: In function `reset_cpu':
> +drivers/sysreset/sysreset-uclass.c:107: multiple definition of `reset_cpu'
> +arch/arm/cpu/armv7m/built-in.o:arch/arm/cpu/armv7m/cpu.c:53: first defined here
> +make[2]: *** [spl/u-boot-spl] Error 1
> +make[1]: *** [spl/u-boot-spl] Error 2
> +make: *** [sub-make] Error 2
> 
> But you have perhaps other patch in your branch...
> 
> => for me select SPL_SYSRESET need to be removed for config STM32F7 to avoid driver/sysreset/uclass.c compilation

Right, thanks for the hint. Seems like I need to not select 
CONFIG_SPL_SYSRESET if CONFIG_SYSRESET wasn't set.

Also, I need to throw this at travis before sending v3...

Regards,
Simon

> 
> For stm32mp and stm32:
> 
> SPL_MISC needed for rcc
> SPL_SYSRESET are needed for only stm32mp1 cause compilation error for stm32
> 
> SPL_FIRMWARE is not needed but I will remove it when this patch will by merged.
> 
> For the other part
> 
> Reviewed-by: Patrick Delaunay <Patrick.delaunay@st.com>
> 
> Thanks,
> Patrick
> 
>> ---
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
