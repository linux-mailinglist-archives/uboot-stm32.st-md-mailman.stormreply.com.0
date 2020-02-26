Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B27DB16FCF8
	for <lists+uboot-stm32@lfdr.de>; Wed, 26 Feb 2020 12:10:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7736EC36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 26 Feb 2020 11:10:01 +0000 (UTC)
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18E64C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2020 11:02:23 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200226110219epoutp03de36270058cfea4f107fb3adea9aef6d~27toZJuUp0736807368epoutp03F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2020 11:02:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200226110219epoutp03de36270058cfea4f107fb3adea9aef6d~27toZJuUp0736807368epoutp03F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1582714939;
 bh=Ziu8iPSi1BZ2y780M3444xkJiTK/61ukYGc8ATE8fzo=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=DIImZHQSiqp6JVug1zebKFn2wxpr/gHZ/Ox4nynC9gHRj/jLar2BaelCdkURccaIV
 VAropIsyey70pO1O8bdHqpx2GcGHxIdOT4I89DfO+Rj5R9jrXXQUPabYP8fI+qgBp+
 tRq5ZkrCPux2mbZUEZSueFy5rlzekhF/j5xUQSf8=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20200226110219epcas1p327a01fb646a9685779c8f92e233bdbeb~27tn7guDr0873008730epcas1p3B;
 Wed, 26 Feb 2020 11:02:19 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.154]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 48SCYj0JX7zMqYlm; Wed, 26 Feb
 2020 11:02:17 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 5D.E1.57028.830565E5; Wed, 26 Feb 2020 20:02:16 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20200226110216epcas1p3a554b990d9b7eb50667a680e81626e18~27tlcSLl12937729377epcas1p3g;
 Wed, 26 Feb 2020 11:02:16 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200226110216epsmtrp2275f86c6c24b827b08077d2cadd91b5c~27tlbj0h01965019650epsmtrp2s;
 Wed, 26 Feb 2020 11:02:16 +0000 (GMT)
X-AuditID: b6c32a35-50bff7000001dec4-5a-5e56503866ac
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 A4.45.10238.830565E5; Wed, 26 Feb 2020 20:02:16 +0900 (KST)
Received: from [10.113.113.235] (unknown [10.113.113.235]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200226110215epsmtip1c99079a1db0fb442406d0ef9d912c6d9~27tkZ5P062155821558epsmtip1V;
 Wed, 26 Feb 2020 11:02:15 +0000 (GMT)
To: Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
From: Jaehoon Chung <jh80.chung@samsung.com>
Message-ID: <64c350e7-8e93-1efa-e496-16249616fc20@samsung.com>
Date: Wed, 26 Feb 2020 20:02:22 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200226103446.1686c09a@jawa>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Ta0gUURTHuTOzu6O1Ne1q3STIhlK0tB3XzTHSiswmEjJ690Eb9OJrX+zs
 9jLIXktZQVGWjuajCLO3aWrmJr4qS40sIsKISO1hPiq0h0TN7hjst9//f88595xzZ0hc80IZ
 QGaY7chm5o200peoaQkJD4tO3JSk+6FlnV2/VGzNuV9K9u29/YD9MPQcY784JXp3t4NgH5QV
 ALai+6+CHauuAWz7jRGMHXQdVbFld8qJZZO5tq5jBFeY84zgisVHBHfgdh3gXrWKOHex4RPG
 dfZI8o/YSHBN9xmu76cLT/TdlrUkHfGpyBaIzCmW1AxzWgy9Zn3yimTDIh0TxkSzUXSgmTeh
 GDouITEsPsMo9U0H7uCNDslK5AWBXhi7xGZx2FFgukWwx9DImmq0RlvDBd4kOMxp4SkW02JG
 p4swSIHbs9K/ttWrrIeZXftfDChywOmQXECSkIqELZWWXOBLaqg6AF/nj2Cy+Abg+/HLE2IM
 wM7vjxW5wMeT8aDHhcsHLgDLS0YJWQxLIu+3wl1XS62D1wZ93Ql+EublXfQk4FQ/Bt8W9nsq
 KakFsHbsIeaOV1OxsHZQ47YJah5scH5UuW1/agt8Msq7bTU1DbYX9BJu24eaD693a902Tulg
 64Uihcwz4OveEkzm2VLBIlxu+YoKlrbaZY6DpRU5Kpm18PPD6gkOgN+HXEqZs2H9wQ5Px5A6
 Im2l5gAmH+hh46XTEzwH3h0/D+TLpsCh0eMKeaNqeMSpkUPmwu6BT9j/+m96/06skIN9FSXY
 STBH9JpM9BpH9BpH9BqnFBBXwHRkFUxpSGCsjPdb3waeLzrUUAfOdCU0A4oE9GT1R5+NSRoF
 v0PYbWoGkMRpP3XlqGSpU/nde5DNkmxzGJHQDAzS4k/hAf4pFun/MNuTGUOEXq9nI5lFBoah
 Z6jfbQ1J0lBpvB1lIWRFtv95GOkTkAPyTaHTgmqn9p9Qc2ejlx4SszZkt6O1N9uCxLGXT8sc
 EcKqvSfvLFV0zLy+LzhOO8sxUDywUggTI+OjesZXB/fEt+Q6qioLLxScuUWi2DWrMzeXXd0z
 0ukH9+U7q0ayM4ejltFNGeTw1OVtC1sn9TfrS0NO9EUVrgWUaHjO7bwURBNCOs+E4jaB/wd/
 UQp/5wMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRmVeSWpSXmKPExsWy7bCSnK5FQFicwbZufou2cz/ZLbZN/8lm
 cX93I6PF83eXmSzetAFZD3eeYbE4tnAmo8XKS/9ZLb5t2cZocXLdByaLt3s72S0Wbl3O4sDj
 cfRcN4vH7IaLLB7zZp1g8WjatIPR48aRWcwei/e8ZPI4ewfI/TtrP4vHwX2GHk9/7GUO4Iri
 sklJzcksSy3St0vgyvh4dBd7QathReOV16wNjJM1uxg5OSQETCSO3dnL3MXIxSEksJtRounM
 EmaIhJTE56dT2boYOYBsYYnDh4shat4ySsyZdZUJJC4sECix5i0XSLkIkHlh0nR2kBpmgRdM
 Euc7HjNCNGwAalgwhRGkik1AR2L7t+NgzbwCdhLb3wqBhFkEVCX2tL1gB7FFBSIknm+/AVbO
 KyAocXLmExaQck4BbYm1l4RBwswCehI7rv9ihbDFJW49mc8EYcsDTZzDPIFRaBaS7llIWmYh
 aZmFpGUBI8sqRsnUguLc9NxiwwLDvNRyveLE3OLSvHS95PzcTYzguNTS3MF4eUn8IUYBDkYl
 Ht4XnKFxQqyJZcWVuYcYJTiYlUR4N34FCvGmJFZWpRblxxeV5qQWH2KU5mBREud9mncsUkgg
 PbEkNTs1tSC1CCbLxMEp1cDYE1v2f+366rVmzhPkln7Sn/1U4VWj9cTZnF3pErvTzb9/zedh
 7VlapfkxYs3ZyeYlC6RLtFYwXSx7G7je3rLvXpq++n5OIZ+EVttny/e1/4hdNv/vvH2Z3Lvk
 t3R89LNSvHihaY5LXIXC75M7JNli6p4q6QUWrY6bdCZtepmgs2S0zE29ojdKLMUZiYZazEXF
 iQDfjRtPxwIAAA==
X-CMS-MailID: 20200226110216epcas1p3a554b990d9b7eb50667a680e81626e18
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200226093502epcas1p1ba4f5fd87eceb20461ddb70a88fe9992
References: <20200226092842.5413-1-patrick.delaunay@st.com>
 <CGME20200226093502epcas1p1ba4f5fd87eceb20461ddb70a88fe9992@epcas1p1.samsung.com>
 <20200226103446.1686c09a@jawa>
X-Mailman-Approved-At: Wed, 26 Feb 2020 11:09:59 +0000
Cc: Marek Vasut <marex@denx.de>, Holger Brunck <holger.brunck@ch.abb.com>,
 Simon Glass <sjg@chromium.org>, Pascal Linder <pascal.linder@edu.hefr.ch>,
 Kever Yang <kever.yang@rock-chips.com>, Ley Foon Tan <ley.foon.tan@intel.com>,
 u-boot@lists.denx.de, Mario Six <mario.six@gdsys.cc>,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/2] configs: migrate
 CONFIG_SET_DFU_ALT_INFO to defconfigs
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

On 2/26/20 6:34 PM, Lukasz Majewski wrote:
> Hi Patrick,
> 
>> Move CONFIG_SET_DFU_ALT_INFO into Kconfig done by moveconfig.py.
> 
> Thank you for the conversion.
> 
> Acked-by: Lukasz Majewski <lukma@denx.de>

Reviewed-by: Jaehoon Chung <jh80.chung@samsung.com>

> 
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>> ---
>>
>>  configs/odroid-xu3_defconfig            | 1 +
>>  configs/odroid_defconfig                | 1 +
>>  configs/stm32mp15_basic_defconfig       | 1 +
>>  configs/stm32mp15_dhcom_basic_defconfig | 1 +
>>  configs/stm32mp15_optee_defconfig       | 1 +
>>  configs/stm32mp15_trusted_defconfig     | 1 +
>>  drivers/dfu/Kconfig                     | 5 +++++
>>  include/configs/odroid.h                | 1 -
>>  include/configs/odroid_xu3.h            | 1 -
>>  include/configs/stm32mp1.h              | 2 --
>>  scripts/config_whitelist.txt            | 1 -
>>  11 files changed, 11 insertions(+), 5 deletions(-)
>>
>> diff --git a/configs/odroid-xu3_defconfig
>> b/configs/odroid-xu3_defconfig index 2e982e1b53..1a2183ce19 100644
>> --- a/configs/odroid-xu3_defconfig
>> +++ b/configs/odroid-xu3_defconfig
>> @@ -39,6 +39,7 @@ CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
>>  CONFIG_ADC=y
>>  CONFIG_ADC_EXYNOS=y
>>  CONFIG_DFU_MMC=y
>> +CONFIG_SET_DFU_ALT_INFO=y
>>  CONFIG_SUPPORT_EMMC_BOOT=y
>>  CONFIG_MMC_DW=y
>>  CONFIG_MTD=y
>> diff --git a/configs/odroid_defconfig b/configs/odroid_defconfig
>> index e4392e477e..345cc3b940 100644
>> --- a/configs/odroid_defconfig
>> +++ b/configs/odroid_defconfig
>> @@ -40,6 +40,7 @@ CONFIG_DEFAULT_DEVICE_TREE="exynos4412-odroid"
>>  CONFIG_SYS_RELOC_GD_ENV_ADDR=y
>>  CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
>>  CONFIG_DFU_MMC=y
>> +CONFIG_SET_DFU_ALT_INFO=y
>>  CONFIG_SYS_I2C_S3C24X0=y
>>  CONFIG_MMC_DW=y
>>  CONFIG_MMC_SDHCI=y
>> diff --git a/configs/stm32mp15_basic_defconfig
>> b/configs/stm32mp15_basic_defconfig index f691306800..4efb1bf9c2
>> 100644 --- a/configs/stm32mp15_basic_defconfig
>> +++ b/configs/stm32mp15_basic_defconfig
>> @@ -71,6 +71,7 @@ CONFIG_DFU_MMC=y
>>  CONFIG_DFU_RAM=y
>>  CONFIG_DFU_MTD=y
>>  CONFIG_DFU_VIRT=y
>> +CONFIG_SET_DFU_ALT_INFO=y
>>  CONFIG_USB_FUNCTION_FASTBOOT=y
>>  CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
>>  CONFIG_FASTBOOT_BUF_SIZE=0x02000000
>> diff --git a/configs/stm32mp15_dhcom_basic_defconfig
>> b/configs/stm32mp15_dhcom_basic_defconfig index
>> 921dea242a..9b5e54748d 100644 ---
>> a/configs/stm32mp15_dhcom_basic_defconfig +++
>> b/configs/stm32mp15_dhcom_basic_defconfig @@ -70,6 +70,7 @@
>> CONFIG_SPL_BLOCK_CACHE=y CONFIG_DFU_MMC=y
>>  CONFIG_DFU_RAM=y
>>  CONFIG_DFU_VIRT=y
>> +CONFIG_SET_DFU_ALT_INFO=y
>>  CONFIG_DM_HWSPINLOCK=y
>>  CONFIG_HWSPINLOCK_STM32=y
>>  CONFIG_DM_I2C=y
>> diff --git a/configs/stm32mp15_optee_defconfig
>> b/configs/stm32mp15_optee_defconfig index 521b24e2cb..54135b28aa
>> 100644 --- a/configs/stm32mp15_optee_defconfig
>> +++ b/configs/stm32mp15_optee_defconfig
>> @@ -58,6 +58,7 @@ CONFIG_DFU_MMC=y
>>  CONFIG_DFU_RAM=y
>>  CONFIG_DFU_MTD=y
>>  CONFIG_DFU_VIRT=y
>> +CONFIG_SET_DFU_ALT_INFO=y
>>  CONFIG_USB_FUNCTION_FASTBOOT=y
>>  CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
>>  CONFIG_FASTBOOT_BUF_SIZE=0x02000000
>> diff --git a/configs/stm32mp15_trusted_defconfig
>> b/configs/stm32mp15_trusted_defconfig index c8b328d01a..d7d0b6c296
>> 100644 --- a/configs/stm32mp15_trusted_defconfig
>> +++ b/configs/stm32mp15_trusted_defconfig
>> @@ -57,6 +57,7 @@ CONFIG_DFU_MMC=y
>>  CONFIG_DFU_RAM=y
>>  CONFIG_DFU_MTD=y
>>  CONFIG_DFU_VIRT=y
>> +CONFIG_SET_DFU_ALT_INFO=y
>>  CONFIG_USB_FUNCTION_FASTBOOT=y
>>  CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
>>  CONFIG_FASTBOOT_BUF_SIZE=0x02000000
>> diff --git a/drivers/dfu/Kconfig b/drivers/dfu/Kconfig
>> index 174fb588a6..5d45d7d7c2 100644
>> --- a/drivers/dfu/Kconfig
>> +++ b/drivers/dfu/Kconfig
>> @@ -81,5 +81,10 @@ config DFU_VIRT
>>  	  used at board level to manage specific behavior
>>  	  (OTP update for example).
>>  
>> +config SET_DFU_ALT_INFO
>> +	bool "Dynamic set of DFU alternate information"
>> +	help
>> +	  This option allows to call the function set_dfu_alt_info to
>> +	  dynamically build dfu_alt_info in board.
>>  endif
>>  endmenu
>> diff --git a/include/configs/odroid.h b/include/configs/odroid.h
>> index a7e2a3d9a2..4044365328 100644
>> --- a/include/configs/odroid.h
>> +++ b/include/configs/odroid.h
>> @@ -64,7 +64,6 @@
>>  	""PARTS_BOOT" part 0 1;" \
>>  	""PARTS_ROOT" part 0 2\0" \
>>  
>> -#define CONFIG_SET_DFU_ALT_INFO
>>  #define CONFIG_SET_DFU_ALT_BUF_LEN	(SZ_1K)
>>  
>>  #define CONFIG_DFU_ALT_BOOT_EMMC \
>> diff --git a/include/configs/odroid_xu3.h
>> b/include/configs/odroid_xu3.h index 47c30543f8..564319c231 100644
>> --- a/include/configs/odroid_xu3.h
>> +++ b/include/configs/odroid_xu3.h
>> @@ -76,7 +76,6 @@
>>  
>>  /* Enable: board/samsung/common/misc.c to use set_dfu_alt_info() */
>>  #define CONFIG_MISC_COMMON
>> -#define CONFIG_SET_DFU_ALT_INFO
>>  #define CONFIG_SET_DFU_ALT_BUF_LEN	(SZ_1K)
>>  
>>  /* Set soc_rev, soc_id, board_rev, board_name, fdtfile */
>> diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
>> index 42717c167e..592638072a 100644
>> --- a/include/configs/stm32mp1.h
>> +++ b/include/configs/stm32mp1.h
>> @@ -90,8 +90,6 @@
>>  #define CONFIG_SYS_MTDPARTS_RUNTIME
>>  #endif
>>  
>> -#define CONFIG_SET_DFU_ALT_INFO
>> -
>>  #ifdef CONFIG_DM_VIDEO
>>  #define CONFIG_VIDEO_BMP_RLE8
>>  #define CONFIG_BMP_16BPP
>> diff --git a/scripts/config_whitelist.txt
>> b/scripts/config_whitelist.txt index 405c62e9be..85d55b182e 100644
>> --- a/scripts/config_whitelist.txt
>> +++ b/scripts/config_whitelist.txt
>> @@ -1529,7 +1529,6 @@ CONFIG_SETUP_MEMORY_TAGS
>>  CONFIG_SET_BIST
>>  CONFIG_SET_BOOTARGS
>>  CONFIG_SET_DFU_ALT_BUF_LEN
>> -CONFIG_SET_DFU_ALT_INFO
>>  CONFIG_SFIO
>>  CONFIG_SF_DATAFLASH
>>  CONFIG_SGI_IP28
> 
> 
> 
> 
> Best regards,
> 
> Lukasz Majewski
> 
> --
> 
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de
> 

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
