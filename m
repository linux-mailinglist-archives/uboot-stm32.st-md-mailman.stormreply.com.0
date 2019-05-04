Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A3113C0F
	for <lists+uboot-stm32@lfdr.de>; Sat,  4 May 2019 22:20:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70DA3C35E07
	for <lists+uboot-stm32@lfdr.de>; Sat,  4 May 2019 20:20:32 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5554C35E04
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  4 May 2019 20:20:30 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id o189so30820wmb.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 04 May 2019 13:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LiR6+0o83VdRj0x8MI8TyqNvTx9GPBFZs1wa7EL3+cw=;
 b=e3GLOIPIb+ZD5z3b+RRqoBrvy0hBx22wgqLaiobPG4P6pgUgJYsFl6PS3V7jr7OQX+
 FPDQf7wzpSJ6XsCKroJTMLHzhnGKaD6dxkiMKPdJmmKweWNoCNyKFgyXdGY8RTBhvdqR
 zLNjggTd4/CXGtdDb5D6cR9YHzW92/sFdPIeUFtlbCkZY9lWiOYH0JniqKnnUU24JD/P
 mungL0w2KUvLu3D8fpaX4+UL01fl1RV5UKWJ1GkqT8tsQxC8TR88b8KGW14RPT0pX/Gp
 oR5ZhklPQHd17ZkIWp690Xo63i9GQP3yEfa6dbVj0kyUd0yUC2uSYeto3HC356cCCwSX
 rS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LiR6+0o83VdRj0x8MI8TyqNvTx9GPBFZs1wa7EL3+cw=;
 b=k1hlNvBXn8sNP8xuoU5K+7c9LtdFn7+Dk9umW3ghvHmXfSJcgue7U97PTtN0VMwS0S
 jDy7qTAxtZ09NR2qEjRb5b8U1kpriOC4mK2OY5kVP5pjOAdplW1S/Qw5/h7POZEjAYJ8
 /uzz3W38bCxdoWFoyZ5NDCYk4KeYCcIXA7hACPeihqQqNv0OnfH0NUg/dbQ/Tbwwd65Z
 BkmXRklFtMeJKSnK5bkhe0A9SfDVt+XsUpxTMUPRFsuV+vGj0U7/TWzxdUvC8qJBIfvU
 1BFGpMO0UAwFGA5f5b2MfJo9DOkTfKoJ8l6fo3In8T7lcsiliJT2LCDgFqMkCL6q+fhk
 42oA==
X-Gm-Message-State: APjAAAWjcQ8f6Duufqt6vQM6vc/N2FLNBRID9amw5khelxYJvwfuTaBz
 DXg4ahzeVQczLgX6IpUNbkE=
X-Google-Smtp-Source: APXvYqyHrcV9YX4YfSxxqSOSJqYQ2Mbqahq47sgCy9PUh5SuiO4WyTo9Zr1d5l/VIAt+bsu+4p+T+g==
X-Received: by 2002:a1c:4102:: with SMTP id o2mr10472867wma.91.1557001230332; 
 Sat, 04 May 2019 13:20:30 -0700 (PDT)
Received: from ?IPv6:2a02:8071:6a3:700:9cbb:6bbc:4af1:2644?
 ([2a02:8071:6a3:700:9cbb:6bbc:4af1:2644])
 by smtp.gmail.com with ESMTPSA id h16sm11811742wrb.31.2019.05.04.13.20.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 04 May 2019 13:20:29 -0700 (PDT)
To: Marek Behun <marek.behun@nic.cz>
References: <20190504200356.22099-1-simon.k.r.goldschmidt@gmail.com>
 <20190504221601.4f02f4ea@nic.cz>
From: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
Message-ID: <b12c3ebd-dee3-815e-d5f8-862796b09657@gmail.com>
Date: Sat, 4 May 2019 22:19:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190504221601.4f02f4ea@nic.cz>
Content-Language: en-US
Cc: Peng Fan <peng.fan@nxp.com>, Christophe Kerello <christophe.kerello@st.com>,
 Vignesh R <vigneshr@ti.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Kever Yang <kever.yang@rock-chips.com>,
 Alex Kiernan <alex.kiernan@gmail.com>, u-boot@lists.denx.de,
 Sjoerd Simons <sjoerd.simons@collabora.co.uk>,
 Klaus Goger <klaus.goger@theobroma-systems.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Fabio Estevam <festevam@gmail.com>, Ruchika Gupta <ruchika.gupta@nxp.com>,
 Qiang Zhao <qiang.zhao@nxp.com>, Marek Vasut <marex@denx.de>,
 Tom Rini <trini@konsulko.com>, Tien Fong Chee <tien.fong.chee@intel.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Abel Vesa <abel.vesa@nxp.com>,
 Sumit Garg <sumit.garg@nxp.com>, Jagan Teki <jagan@openedev.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Michal Simek <michal.simek@xilinx.com>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Stefano Babic <sbabic@denx.de>, Shengzhou Liu <Shengzhou.Liu@nxp.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, York Sun <york.sun@nxp.com>,
 Siva Durga Prasad Paladugu <siva.durga.paladugu@xilinx.com>,
 Peter Robinson <pbrobinson@gmail.com>,
 Otavio Salvador <otavio@ossystems.com.br>,
 Rajesh Bhagat <rajesh.bhagat@nxp.com>, Alison Wang <alison.wang@nxp.com>,
 Mian Yousaf Kaukab <ykaukab@suse.de>, Ashish Kumar <ashish.kumar@nxp.com>,
 Jeremy Gebben <jgebben@sweptlaser.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Adam Ford <aford173@gmail.com>,
 Mingkai Hu <mingkai.hu@nxp.com>, Albert Aribaud <albert.u.boot@aribaud.net>,
 Bin Meng <bmeng.cn@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Po Liu <po.liu@nxp.com>,
 Patrice Chotard <patrice.chotard@st.com>, "Andrew F. Davis" <afd@ti.com>,
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

Am 04.05.2019 um 22:16 schrieb Marek Behun:
> On Sat,  4 May 2019 22:03:56 +0200
> Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com> wrote:
> 
>> diff --git a/include/configs/turris_omnia.h b/include/configs/turris_omnia.h
>> index 018f54428b..7cffdc3d51 100644
>> --- a/include/configs/turris_omnia.h
>> +++ b/include/configs/turris_omnia.h
>> @@ -52,6 +52,8 @@
>>   #define CONFIG_SPL_STACK		(0x40000000 + ((192 - 16) << 10))
>>   #define CONFIG_SPL_BOOTROM_SAVE		(CONFIG_SPL_STACK + 4)
>>   #define CONFIG_SPL_DRIVERS_MISC_SUPPORT
>> +#define CONFIG_SPL_DRIVERS_FIRMWARE_SUPPORT
>> +#define CONFIG_SPL_SYSRESET_SUPPORT
> 
> These are not required for Turris Omnia, only
> CONFIG_SPL_DRIVERS_MISC_SUPPORT for ATSHA204A.

I would have suspected that not all of these are required for all boards 
I changed. However, I'd rather have this patch as it is (it adds kconfig 
symbols but shouldn't change the binaries) and the various board 
maintainers can then reduce their configuration as fits as a follow-up.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
