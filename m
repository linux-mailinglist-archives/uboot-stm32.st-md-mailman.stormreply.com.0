Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBEF77E21A
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Aug 2023 15:03:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FE01C6B45E;
	Wed, 16 Aug 2023 13:03:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14A0CC6907A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Aug 2023 13:03:31 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37G9HYMx006657; Wed, 16 Aug 2023 15:03:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 content-type:message-id:date:mime-version:subject:from:to:cc
 :references:in-reply-to; s=selector1; bh=Bb3mHQ0N/5fLEreOaY9o5cV
 HmpI7gOv7m/FtPZEJ1X4=; b=y76dr4T1hx6mkSN3bnNtQpIhHOBXMmvVBLw7WVt
 BSyXc3ZiT3XnTNyNfbtHn5qToMTP88P7HswNdWHoraIfm7gkmm4HOFKWl/2voblU
 5up4OqNr0AcsWxvfEeVoLUrgzD5TBAlldAkjtIMdT6sAyuNWJ0qGiOqkO282EOpi
 a56B9h9elDmwdZw/FyO6I/GlYtWyXz/aouz7I7yOBUefMSOwQ5TviQj0ISvX4Urc
 w6ZE40Cmtsaa13GE5KckZbJ96bVPsa3dat4GknzNfjgFus8uxHwIZIilJHMgulv9
 SjFQ26bpSmlHsUk7eW/cC6mmVZeJ4AXSD0mktrfZSLfyyhA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sgupts9gh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Aug 2023 15:03:28 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0647C100061;
 Wed, 16 Aug 2023 15:03:28 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EBA6823C69E;
 Wed, 16 Aug 2023 15:03:27 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 16 Aug
 2023 15:03:27 +0200
Content-Type: multipart/mixed; boundary="------------3f5xutyYOHSvHCnpfyWF1wEm"
Message-ID: <561128fb-e8ab-2149-a5f7-90fcbe085d83@foss.st.com>
Date: Wed, 16 Aug 2023 15:03:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20230710133057.1.Ic435a20560fd2da410678dd019f7b2976a83a884@changeid>
 <CABGWkvqjrZ7JRML9Wmx+kLnhOtOvFdFbOE9dcZAcCkfDHe9NMw@mail.gmail.com>
 <9f4c62eb-8217-d45a-1005-cdcd4afa8f7d@foss.st.com>
 <CABGWkvqzs9KZfRozZySfK8EFqTtCmcU=Rdrkz2oh2bk=iu-jag@mail.gmail.com>
 <cd0fe05b-62e7-d770-655e-5887dd41fdac@foss.st.com>
In-Reply-To: <cd0fe05b-62e7-d770-655e-5887dd41fdac@foss.st.com>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-16_12,2023-08-15_02,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] board: stm32mp1: add splash screen with
 stmicroelectronics logo
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
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--------------3f5xutyYOHSvHCnpfyWF1wEm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit



On 8/16/23 14:08, Patrice CHOTARD wrote:
> 
> 
> On 8/14/23 16:35, Dario Binacchi wrote:
>> Patrice, All
>>
>> On Mon, Aug 7, 2023 at 9:41 AM Patrice CHOTARD
>> <patrice.chotard@foss.st.com> wrote:
>>>
>>>
>>>
>>> On 7/10/23 21:02, Dario Binacchi wrote:
>>>> Hi Patrick,
>>>>
>>>> On Mon, Jul 10, 2023 at 1:31 PM Patrick Delaunay
>>>> <patrick.delaunay@foss.st.com> wrote:
>>>>>
>>>>> Display the STMicroelectronics logo with features VIDEO_LOGO and
>>>>> SPLASH_SCREEN on STMicroelectronics boards.
>>>>>
>>>>> With CONFIG_SYS_VENDOR = "st", the logo st.bmp is selected, loaded at the
>>>>> address indicated by splashimage and centered with "splashpos=m,m".
>>>>>
>>>>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>>>>> ---
>>>>>
>>>>>  MAINTAINERS                           |   1 +
>>>>>  configs/stm32mp15_basic_defconfig     |   3 +++
>>>>>  configs/stm32mp15_defconfig           |   3 +++
>>>>>  configs/stm32mp15_trusted_defconfig   |   3 +++
>>>>>  include/configs/stm32mp15_st_common.h |   4 +++-
>>>>>  tools/logos/st.bmp                    | Bin 0 -> 18244 bytes
>>>>>  6 files changed, 13 insertions(+), 1 deletion(-)
>>>>>  create mode 100644 tools/logos/st.bmp
>>>>>
>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>> index d724b6467344..dfe9409bc7fe 100644
>>>>> --- a/MAINTAINERS
>>>>> +++ b/MAINTAINERS
>>>>> @@ -578,6 +578,7 @@ F:  include/dt-bindings/clock/stm32mp*
>>>>>  F:     include/dt-bindings/pinctrl/stm32-pinfunc.h
>>>>>  F:     include/dt-bindings/reset/stm32mp*
>>>>>  F:     include/stm32_rcc.h
>>>>> +F:     tools/logos/st.bmp
>>>>>  F:     tools/stm32image.c
>>>>>  N:     stm
>>>>>  N:     stm32
>>>>> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
>>>>> index 424ae5dbdfaf..9ea5aaa7145a 100644
>>>>> --- a/configs/stm32mp15_basic_defconfig
>>>>> +++ b/configs/stm32mp15_basic_defconfig
>>>>> @@ -171,6 +171,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x0483
>>>>>  CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
>>>>>  CONFIG_USB_GADGET_DWC2_OTG=y
>>>>>  CONFIG_VIDEO=y
>>>>> +CONFIG_VIDEO_LOGO=y
>>>>>  CONFIG_BACKLIGHT_GPIO=y
>>>>>  CONFIG_VIDEO_LCD_ORISETECH_OTM8009A=y
>>>>>  CONFIG_VIDEO_LCD_RAYDIUM_RM68200=y
>>>>> @@ -178,6 +179,8 @@ CONFIG_VIDEO_STM32=y
>>>>>  CONFIG_VIDEO_STM32_DSI=y
>>>>>  CONFIG_VIDEO_STM32_MAX_XRES=1280
>>>>>  CONFIG_VIDEO_STM32_MAX_YRES=800
>>>>> +CONFIG_SPLASH_SCREEN=y
>>>>> +CONFIG_SPLASH_SCREEN_ALIGN=y
>>>>>  CONFIG_BMP_16BPP=y
>>>>>  CONFIG_BMP_24BPP=y
>>>>>  CONFIG_BMP_32BPP=y
>>>>> diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
>>>>> index 2700b5c49910..4d0a81f8a871 100644
>>>>> --- a/configs/stm32mp15_defconfig
>>>>> +++ b/configs/stm32mp15_defconfig
>>>>> @@ -147,6 +147,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x0483
>>>>>  CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
>>>>>  CONFIG_USB_GADGET_DWC2_OTG=y
>>>>>  CONFIG_VIDEO=y
>>>>> +CONFIG_VIDEO_LOGO=y
>>>>>  CONFIG_BACKLIGHT_GPIO=y
>>>>>  CONFIG_VIDEO_LCD_ORISETECH_OTM8009A=y
>>>>>  CONFIG_VIDEO_LCD_RAYDIUM_RM68200=y
>>>>> @@ -154,6 +155,8 @@ CONFIG_VIDEO_STM32=y
>>>>>  CONFIG_VIDEO_STM32_DSI=y
>>>>>  CONFIG_VIDEO_STM32_MAX_XRES=1280
>>>>>  CONFIG_VIDEO_STM32_MAX_YRES=800
>>>>> +CONFIG_SPLASH_SCREEN=y
>>>>> +CONFIG_SPLASH_SCREEN_ALIGN=y
>>>>>  CONFIG_BMP_16BPP=y
>>>>>  CONFIG_BMP_24BPP=y
>>>>>  CONFIG_BMP_32BPP=y
>>>>> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
>>>>> index 5b94e0c6d2e7..0a7d8624858d 100644
>>>>> --- a/configs/stm32mp15_trusted_defconfig
>>>>> +++ b/configs/stm32mp15_trusted_defconfig
>>>>> @@ -147,6 +147,7 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x0483
>>>>>  CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
>>>>>  CONFIG_USB_GADGET_DWC2_OTG=y
>>>>>  CONFIG_VIDEO=y
>>>>> +CONFIG_VIDEO_LOGO=y
>>>>>  CONFIG_BACKLIGHT_GPIO=y
>>>>>  CONFIG_VIDEO_LCD_ORISETECH_OTM8009A=y
>>>>>  CONFIG_VIDEO_LCD_RAYDIUM_RM68200=y
>>>>> @@ -154,6 +155,8 @@ CONFIG_VIDEO_STM32=y
>>>>>  CONFIG_VIDEO_STM32_DSI=y
>>>>>  CONFIG_VIDEO_STM32_MAX_XRES=1280
>>>>>  CONFIG_VIDEO_STM32_MAX_YRES=800
>>>>> +CONFIG_SPLASH_SCREEN=y
>>>>> +CONFIG_SPLASH_SCREEN_ALIGN=y
>>>>>  CONFIG_BMP_16BPP=y
>>>>>  CONFIG_BMP_24BPP=y
>>>>>  CONFIG_BMP_32BPP=y
>>>>> diff --git a/include/configs/stm32mp15_st_common.h b/include/configs/stm32mp15_st_common.h
>>>>> index b45982a35b8c..60838cb0e3f0 100644
>>>>> --- a/include/configs/stm32mp15_st_common.h
>>>>> +++ b/include/configs/stm32mp15_st_common.h
>>>>> @@ -10,7 +10,9 @@
>>>>>
>>>>>  #define STM32MP_BOARD_EXTRA_ENV \
>>>>>         "usb_pgood_delay=2000\0" \
>>>>> -       "console=ttySTM0\0"
>>>>> +       "console=ttySTM0\0" \
>>>>> +       "splashimage=" __stringify(CONFIG_SYS_LOAD_ADDR) "\0" \
>>>>> +       "splashpos=m,m\0"
>>>>>
>>>>>  #include <configs/stm32mp15_common.h>
>>>>>
>>>>> diff --git a/tools/logos/st.bmp b/tools/logos/st.bmp
>>>>> new file mode 100644
>>>>> index 0000000000000000000000000000000000000000..f59d3c5cef6b8bce5213a1ef42a9cdaa3c5dbc58
>>>>> GIT binary patch
>>>>> literal 18244
>>>>> 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
>>>>>
>>>>> literal 0
>>>>> HcmV?d00001
>>>>>
>>>>> --
>>>>> 2.25.1
>>>>>
>>>>
>>>> I downloaded the patch from Patchwork, but when I apply it (git am
>>>> board-stm32mp1-add-splash-screen-with-stmicroelectronics-logo.patch),
>>>> the file tools/logos/st.bmp is empty, and the compilation fails.
>>>> I'm sorry for the stupid question, but what am I doing wrong?
>>>>
>>>> Thanks and regards,
>>>> Dario
>>>
>>> Hi Dario
>>>
>>> I applied this patch on v2023.07 U-Boot tags and everything works fine, no
>>> compilation errors and the logo is displayed as described in Patrick's patch.
>>
>> I run the next commands:
>> $ git checkout -b 2023.07 v2023.07
>> $ git am ~/Downloads/board-stm32mp1-add-splash-screen-with-stmicroelectronics-logo.patch
>>
>>>
>>> The tools/logos/st.bmp is not empty, its size is 18244 bytes.
>>
>> $ file tools/logos/st.bmp
>> tools/logos/st.bmp: empty
> 
> 
> Hi Dario
> 
> I found the reason why we got different behavior.
> 
> In my side i retrieved the patch from my mailer (Thunderbird) and not
> from patchwork as you did.
> 
> I confirm, from patchwork i get the same issue as yours, there is an
> issue with binary part of the patch => st.bmp file
> 
> When part of the patch include binary, we should use --binary option 
> which was not the case when Patrick generated this patch.
> 
> I will resubmit the patch with correct option.

I generate again this patch using --binary and full-index options, i submitted it
to the mailing list but unfortunately, the issue is the same.

It seems that patchwork can't handle correctly patch included binary parts.

Please find attached the patch to try in your side

Patrice

> 
> Thanks for pointing this issue.
> 
> Patrice
> 
>>
>>>
>>> Can you show the compilation error you get ?
>>>
>>
>> HOSTCC  tools/spl_size_limit
>> tools/bmp_logo --gen-info ./tools/logos/st.bmp > include/bmp_logo.h
>> ERROR: Input file is not a bitmap
>> make[3]: *** [tools/Makefile:315: include/bmp_logo.h] Error 1
>> make[3]: *** Deleting file 'include/bmp_logo.h'
>> make[3]: *** Waiting for unfinished jobs....
>> make[2]: *** [Makefile:1853: tools] Error 2
>> make[1]: *** [package/pkg-generic.mk:293:
>> /home/dario/projects/passgat/stm32mp157f-dk2/buildroot/output/build/uboot-custom/.stamp_built]
>> Error 2
>> make: *** [Makefile:82: _all] Error 2
>>
>> Thanks and regards,
>> Dario
>>
>>> Thanks
>>> Patrice
>>
>>
>>
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
--------------3f5xutyYOHSvHCnpfyWF1wEm
Content-Type: text/x-patch; charset="UTF-8";
	name="0001-board-stm32mp1-add-splash-screen-with-stmicroelectro.patch"
Content-Disposition: attachment;
	filename*0="0001-board-stm32mp1-add-splash-screen-with-stmicroelectro.pa";
	filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA1NWIxZGJlNDZjMTJkN2JjYmY5Njg1YzBmN2Q3MjQyZDIxNTg5OTI5IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1
bmF5QGZvc3Muc3QuY29tPgpEYXRlOiBNb24sIDEwIEp1bCAyMDIzIDEzOjMwOjU5ICswMjAw
ClN1YmplY3Q6IFtVLUJPT1QgaW50ZXJuYWxdIGJvYXJkOiBzdG0zMm1wMTogYWRkIHNwbGFz
aCBzY3JlZW4gd2l0aAogc3RtaWNyb2VsZWN0cm9uaWNzIGxvZ28KCkRpc3BsYXkgdGhlIFNU
TWljcm9lbGVjdHJvbmljcyBsb2dvIHdpdGggZmVhdHVyZXMgVklERU9fTE9HTyBhbmQKU1BM
QVNIX1NDUkVFTiBvbiBTVE1pY3JvZWxlY3Ryb25pY3MgYm9hcmRzLgoKV2l0aCBDT05GSUdf
U1lTX1ZFTkRPUiA9ICJzdCIsIHRoZSBsb2dvIHN0LmJtcCBpcyBzZWxlY3RlZCwgbG9hZGVk
IGF0IHRoZQphZGRyZXNzIGluZGljYXRlZCBieSBzcGxhc2hpbWFnZSBhbmQgY2VudGVyZWQg
d2l0aCAic3BsYXNocG9zPW0sbSIuCgpTZXJpZXMtdmVyc2lvbjogMgpTZXJpZXMtY2hhbmdl
czoyCiAgLSBnZW5lcmF0ZSBwYXRjaCB1c2luZyAtLWJpbmFyeSBhbmQgLS1mdWxsLWluZGV4
IG9wdGlvbi4KClNpZ25lZC1vZmYtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVs
YXVuYXlAZm9zcy5zdC5jb20+Ci0tLQogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgMSArCiBjb25maWdzL3N0bTMybXAxNV9iYXNpY19kZWZjb25maWcgICAg
IHwgICAzICsrKwogY29uZmlncy9zdG0zMm1wMTVfZGVmY29uZmlnICAgICAgICAgICB8ICAg
MyArKysKIGNvbmZpZ3Mvc3RtMzJtcDE1X3RydXN0ZWRfZGVmY29uZmlnICAgfCAgIDMgKysr
CiBpbmNsdWRlL2NvbmZpZ3Mvc3RtMzJtcDE1X3N0X2NvbW1vbi5oIHwgICA0ICsrKy0KIHRv
b2xzL2xvZ29zL3N0LmJtcCAgICAgICAgICAgICAgICAgICAgfCBCaW4gMCAtPiAxODI0NCBi
eXRlcwogNiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvbG9nb3Mvc3QuYm1wCgpkaWZmIC0tZ2l0IGEv
TUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCAzYmY2MGM0NjQzYS4uNTI1MDk4ZTIy
ZGUgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC01Nzcs
NiArNTc3LDcgQEAgRjoJaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9zdG0zMm1wKgogRjoJ
aW5jbHVkZS9kdC1iaW5kaW5ncy9waW5jdHJsL3N0bTMyLXBpbmZ1bmMuaAogRjoJaW5jbHVk
ZS9kdC1iaW5kaW5ncy9yZXNldC9zdG0zMm1wKgogRjoJaW5jbHVkZS9zdG0zMl9yY2MuaAor
RjoJdG9vbHMvbG9nb3Mvc3QuYm1wCiBGOgl0b29scy9zdG0zMmltYWdlLmMKIE46CXN0bQog
TjoJc3RtMzIKZGlmZiAtLWdpdCBhL2NvbmZpZ3Mvc3RtMzJtcDE1X2Jhc2ljX2RlZmNvbmZp
ZyBiL2NvbmZpZ3Mvc3RtMzJtcDE1X2Jhc2ljX2RlZmNvbmZpZwppbmRleCAxMzM1NWViYjQ2
OS4uOTUzZjZlYjM3NmYgMTAwNjQ0Ci0tLSBhL2NvbmZpZ3Mvc3RtMzJtcDE1X2Jhc2ljX2Rl
ZmNvbmZpZworKysgYi9jb25maWdzL3N0bTMybXAxNV9iYXNpY19kZWZjb25maWcKQEAgLTE3
NSw2ICsxNzUsNyBAQCBDT05GSUdfVVNCX0dBREdFVF9WRU5ET1JfTlVNPTB4MDQ4MwogQ09O
RklHX1VTQl9HQURHRVRfUFJPRFVDVF9OVU09MHg1NzIwCiBDT05GSUdfVVNCX0dBREdFVF9E
V0MyX09URz15CiBDT05GSUdfVklERU89eQorQ09ORklHX1ZJREVPX0xPR089eQogQ09ORklH
X0JBQ0tMSUdIVF9HUElPPXkKIENPTkZJR19WSURFT19MQ0RfT1JJU0VURUNIX09UTTgwMDlB
PXkKIENPTkZJR19WSURFT19MQ0RfUkFZRElVTV9STTY4MjAwPXkKQEAgLTE4Miw2ICsxODMs
OCBAQCBDT05GSUdfVklERU9fU1RNMzI9eQogQ09ORklHX1ZJREVPX1NUTTMyX0RTST15CiBD
T05GSUdfVklERU9fU1RNMzJfTUFYX1hSRVM9MTI4MAogQ09ORklHX1ZJREVPX1NUTTMyX01B
WF9ZUkVTPTgwMAorQ09ORklHX1NQTEFTSF9TQ1JFRU49eQorQ09ORklHX1NQTEFTSF9TQ1JF
RU5fQUxJR049eQogQ09ORklHX0JNUF8xNkJQUD15CiBDT05GSUdfQk1QXzI0QlBQPXkKIENP
TkZJR19CTVBfMzJCUFA9eQpkaWZmIC0tZ2l0IGEvY29uZmlncy9zdG0zMm1wMTVfZGVmY29u
ZmlnIGIvY29uZmlncy9zdG0zMm1wMTVfZGVmY29uZmlnCmluZGV4IDI2NjlhYWUwZjJmLi5k
ZDYxOWU2NDI5YiAxMDA2NDQKLS0tIGEvY29uZmlncy9zdG0zMm1wMTVfZGVmY29uZmlnCisr
KyBiL2NvbmZpZ3Mvc3RtMzJtcDE1X2RlZmNvbmZpZwpAQCAtMTUxLDYgKzE1MSw3IEBAIENP
TkZJR19VU0JfR0FER0VUX1ZFTkRPUl9OVU09MHgwNDgzCiBDT05GSUdfVVNCX0dBREdFVF9Q
Uk9EVUNUX05VTT0weDU3MjAKIENPTkZJR19VU0JfR0FER0VUX0RXQzJfT1RHPXkKIENPTkZJ
R19WSURFTz15CitDT05GSUdfVklERU9fTE9HTz15CiBDT05GSUdfQkFDS0xJR0hUX0dQSU89
eQogQ09ORklHX1ZJREVPX0xDRF9PUklTRVRFQ0hfT1RNODAwOUE9eQogQ09ORklHX1ZJREVP
X0xDRF9SQVlESVVNX1JNNjgyMDA9eQpAQCAtMTU4LDYgKzE1OSw4IEBAIENPTkZJR19WSURF
T19TVE0zMj15CiBDT05GSUdfVklERU9fU1RNMzJfRFNJPXkKIENPTkZJR19WSURFT19TVE0z
Ml9NQVhfWFJFUz0xMjgwCiBDT05GSUdfVklERU9fU1RNMzJfTUFYX1lSRVM9ODAwCitDT05G
SUdfU1BMQVNIX1NDUkVFTj15CitDT05GSUdfU1BMQVNIX1NDUkVFTl9BTElHTj15CiBDT05G
SUdfQk1QXzE2QlBQPXkKIENPTkZJR19CTVBfMjRCUFA9eQogQ09ORklHX0JNUF8zMkJQUD15
CmRpZmYgLS1naXQgYS9jb25maWdzL3N0bTMybXAxNV90cnVzdGVkX2RlZmNvbmZpZyBiL2Nv
bmZpZ3Mvc3RtMzJtcDE1X3RydXN0ZWRfZGVmY29uZmlnCmluZGV4IDVmMGZiNDU2NTEwLi5h
YmExODJjOTNiZSAxMDA2NDQKLS0tIGEvY29uZmlncy9zdG0zMm1wMTVfdHJ1c3RlZF9kZWZj
b25maWcKKysrIGIvY29uZmlncy9zdG0zMm1wMTVfdHJ1c3RlZF9kZWZjb25maWcKQEAgLTE1
MSw2ICsxNTEsNyBAQCBDT05GSUdfVVNCX0dBREdFVF9WRU5ET1JfTlVNPTB4MDQ4MwogQ09O
RklHX1VTQl9HQURHRVRfUFJPRFVDVF9OVU09MHg1NzIwCiBDT05GSUdfVVNCX0dBREdFVF9E
V0MyX09URz15CiBDT05GSUdfVklERU89eQorQ09ORklHX1ZJREVPX0xPR089eQogQ09ORklH
X0JBQ0tMSUdIVF9HUElPPXkKIENPTkZJR19WSURFT19MQ0RfT1JJU0VURUNIX09UTTgwMDlB
PXkKIENPTkZJR19WSURFT19MQ0RfUkFZRElVTV9STTY4MjAwPXkKQEAgLTE1OCw2ICsxNTks
OCBAQCBDT05GSUdfVklERU9fU1RNMzI9eQogQ09ORklHX1ZJREVPX1NUTTMyX0RTST15CiBD
T05GSUdfVklERU9fU1RNMzJfTUFYX1hSRVM9MTI4MAogQ09ORklHX1ZJREVPX1NUTTMyX01B
WF9ZUkVTPTgwMAorQ09ORklHX1NQTEFTSF9TQ1JFRU49eQorQ09ORklHX1NQTEFTSF9TQ1JF
RU5fQUxJR049eQogQ09ORklHX0JNUF8xNkJQUD15CiBDT05GSUdfQk1QXzI0QlBQPXkKIENP
TkZJR19CTVBfMzJCUFA9eQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9jb25maWdzL3N0bTMybXAx
NV9zdF9jb21tb24uaCBiL2luY2x1ZGUvY29uZmlncy9zdG0zMm1wMTVfc3RfY29tbW9uLmgK
aW5kZXggODY2Y2Q3YTcxOWYuLmM0ODU0Y2IwZGRiIDEwMDY0NAotLS0gYS9pbmNsdWRlL2Nv
bmZpZ3Mvc3RtMzJtcDE1X3N0X2NvbW1vbi5oCisrKyBiL2luY2x1ZGUvY29uZmlncy9zdG0z
Mm1wMTVfc3RfY29tbW9uLmgKQEAgLTEwLDcgKzEwLDkgQEAKIAogI2RlZmluZSBTVE0zMk1Q
X0JPQVJEX0VYVFJBX0VOViBcCiAJInVzYl9wZ29vZF9kZWxheT0yMDAwXDAiIFwKLQkiY29u
c29sZT10dHlTVE0wXDAiCisJImNvbnNvbGU9dHR5U1RNMFwwIiBcCisJInNwbGFzaGltYWdl
PSIgX19zdHJpbmdpZnkoQ09ORklHX1NZU19MT0FEX0FERFIpICJcMCIgXAorCSJzcGxhc2hw
b3M9bSxtXDAiCiAKICNpbmNsdWRlIDxjb25maWdzL3N0bTMybXAxNV9jb21tb24uaD4KIApk
aWZmIC0tZ2l0IGEvdG9vbHMvbG9nb3Mvc3QuYm1wIGIvdG9vbHMvbG9nb3Mvc3QuYm1wCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAuLmY1OWQzYzVjZWY2YjhiY2U1MjEzYTFlZjQyYTljZGFhM2M1ZGJjNTgK
R0lUIGJpbmFyeSBwYXRjaApsaXRlcmFsIDE4MjQ0CnpjbWVIdmNVVi0oKHMhTFhWUEpxRWc5
SGZ6PldWbz40MlRnXyUkUDtRdzYzblE9QTUmYjV6T0tXcTl8Wk9LdjU3Pgp6MU9aOVRweVYo
RTZaWW8jLW1tJSQwfCt5RnBZUHhJZEgxPSFKTGghJHM7aiVKdEU9aTFjWn1jSUB4Y0clI1Fe
Kz4KenptYHd7PD03fU56eWBwMTE2VWVxK0hkJHcrTC1hdkh7eVQoenkxLWxwYFBxVWdJXmFA
bkNmV0B7PUotRmRTNXF+CnpJaUwmNzlfJEhvaFZfQn51Zjh5RSlCc3JFSnMxfUg0MT5rdnk8
b30yUTRsIVU4PHpSYEsreDNqNWJRcUBSP1A1KQp6bTl3VjY+ZTxzXiYwSyVAYW8hQUFKQVcz
ZVRRfj5TRkFqajhtJn02PWZlVD5jdlZ7OzV2PX14OEZOTXUzMCU2T2wKekFsU05rSWMhQEs0
Qk9ZUGdkSVB2Zn1RS3V6Xj9UXyF0TT1nVmI4e091czM4cT9FQj9zKnVRQjU5TX0+OTJlPHdM
CnpocWk1ayFgbkIqa3NWdiQ9KzNRaFl9YS07ekl6ODgtP0l9PT9BLSs/X3c5eUwybGx8fWdM
QChMJl58YkdjdDR5eQp6YXNiO3dJQ3UwQW9JaUZMRSp3N3M3ZiYzOE9EQilQckJsWnQ/RFBx
XjlDe01NJnp5cFl2IUB+QVRxcztRZStJNmUKektNVTZgb1Alb0AmJV5hZzd2TShOMS1OPG5C
SFJxVzFoPk0mO0M5NGloYGJVR2t5aigmJmIwe21fNCphS2Q7S2NoCnp5PlNocVplRUF6VFE/
eTNfNkBqcWB6RkxoLWghQXJ4OGVTO2s/P0BEeUxUV3E+UXtJZWVIUnx4aS1OZUFYbyRPaQp6
NTh8O1VKY3htVyohJUR9XzVuUDNpMHg0PEpkSndAJipDMXp2LW41d0pSdUdlNlhHSDlhWGg/
dWw3UV9vQnQzbHMKeiQ8SWk4M010UUBLfXpCP2MkeFNkVWNFPyFTNG9NR24pQ3V2bGF0X2VO
KW8oRE5ycEVzUXl9ZFhYKWhyP14lY0EmCno/UjY/LXlkbXYxV1R3ND0lPTk8I0U8RncyeS1r
UHIqZ2o7dWclNm87QXVCVGp2ZmdGRk43Q05FZ1h8QmF5QCNCdgp6NUFjYiFrNkRtUVRKfWZD
JWdLaVBQZFZeOF9ZPH5VRDlGUT5wOWg3Y2VhP3A+KGg1RjlhWHxxVDdaeU5DVkloPGgKejZ+
ZFJ8QjlOMzZnWS0pWXdsN2RCQXgjMmJyS0N5V1RQYk8hUTErRnl1VGNKdHZ+TiZSaE9OOHxE
b0x2LWhwTEpTCnpzSCZgaD5kSCF9dUJ3RVpzdyR8ZHU3Y1g/WU4pTkxoUHMqPnNIPzRrYHIy
Qmt1T3FEdldjOCVnZ0lxP00zPnJ3Mgp6JWJ9NjloNllmTyo0UE0yZyN1SmNDOCQtVHNvKnk/
WD0/Y0dII1BqPng4TDlvZkF8Z2xfPWk4aHBaQHFxX3x1Pk0KejFiLSYmJndxeCRrb0szcXor
WHhHRGB8Zyl6eHxFMHpybyowYH1eUEZBRWY9YEFNbnFBe3VCUTdGVmctNnwwZUM8Cnp8QXpu
aHBafGdYe08zUkxBTjVpLXtOS08tbSNvMFEpV0U1fVVKRzhFVzIqKT5IKz1ucEghdWVHbSVM
WUlPJDR9MAp6LXA3bXYlZDspLWI3bGc+a29TLUwhMG9kM3ktPUFtMypkNGNTZTFaS0JFMiVV
VUVocW9WNl9FPVRlcj0yMmxyK2kKenR3ZXJ+MDVzTFApakolVXljNHYlVl5uM29abkU3OCFk
PCVxSmhiQCNzTz9kWDd5alRIIz49NjNqLTNSfm1zJmxpCnpAMUMkVXpTWjtCKlU8XlpQMHl7
aG5MfVJIQU1WSEhmK193Z2RUe3ptUDdAWEIkPVRnK1dHTFNnO3w7ZHdUSj5aRQp6aXxuQFpK
I2xfb05wSjx0Nmk+ckwmdEE8P3RKNERvcm1NZUk4aHImfVM7ZFdVK0xjS287fXpzZThsZ1dA
JWh2YUgKemEyazQ2dCRyS0M4RzRAekg5ODV4UT5UTnZZM0tSfF9vVSsxVnhLTCFORyt+Z1U7
KXJeQUVDeGUrZilFNzE9PHlTCnpyM08ofCV1bUMqU1EqLWMkQHs2bk5GS1VxJUN6TkNZVzNA
UlZBWDB9bGFYaW4rc05JTUVMb3RvUF5DeX5xUmY2Qwp6cE85M2pSdV4zZlNeKGxEQVk4aDF0
T0l5eGJ8KD1MalNaeiZ7VmozV087cXRUb1dzKjsmYEh6I1RuKW43VXpkN3oKejViP2dtV356
a3JLYm94RmswKiNPTyokVnUrfG40UnJyc3dEdE9pYD9TMkdAYVlvK2hiJmdwMnsrPyNWQCNn
M1BKCnpaeWZUanpkcWE5a1FSV3BwSGs2RU48fW1fN09+UHRKMTJIR3g4JCtJYWE9YH1MfFYp
NWk9d3V5UXFGVVVMQXQ2Pgp6NUI1JkF2dVVRMi1ycyVyRE5tUHdZc2FaZm8tUFhNUjFJSjUl
KHReXnJifU42WDIwLXNzOXtiVDRaRGp7JHNlcmwKej87QHQ0ZyklMnRWND1+N1hIJkZ1azNe
MFlGVCtFfGI/Q0AqOUV8JT9rI1JyZnBmQGReNzhNT2ZjUj81eHdZamYkCnp6aSVMQ204PmZO
JTR9UDM7U21GSWNOQlRvbUpqYWZZRUlFc3A1NExONlMoZTlNd0d7OHZJWWNFN1ArKm1ESk4o
Xwp6YUpsMkhTKDsrT2l+QCRKMiUpQCt2WG16dEAkWVpyJlR9NTEySUk2fjZMYk5zdFBEWTVX
TkhobjhIO1RCd0ZwUCoKenkzYkVmMX5fLW9RaX41NzFKYDU4PHxWeFpoSiFiNkcxPiZlJjBB
KT1YPU0rPyltTjIwbX5SZjxjbShRfFNvTEtBCnp6QFB9Q3Y4PmU9YT44MmQkMyt9TDV3bXU1
SCM1Jj5gbzslZDAyZFQkYjtjcXYqaHVJZmBlQEpISWkmeFZ7X0ZrOwp6SGEpZlVUKkxMemhU
WU89cXt8UFQ1XiRCQHI/LTExMSFfKXlDP1hvPGxKTDFzZVZQJTkjfld0dCRSYE43PFVfV1UK
ek43Tk8qJiNtTlZlSHZHQENUMn1QOCQlajI3KDkyWnl0PSRiMzUqJlR5b0ZWIT5KfCs9ZmdA
QldvbX1HT0ZufU43Cno2MFktNmR7XzQrSnZfakVGI3BhUSpJODlyb1JqJUJKdXx6WVN+VVNf
al5IQDgoRl5RM2loPnJabDFvY15uNkx0SQp6d148UHFMVWo7MSlqcnhid1VAPGtwM2BXUXJR
K2FONHxDdUVTV2BFQCVjVT81PkdtT0FXbHJxanNTWUR+eHspWlUKekphZGw9NFp3Kl9maTxf
cVUtWH5AQDQqTURjTyRoQFMkVFZqYHhxXj8pdGYrNjFNIzRWMTFXUndSaTRIYWh5cDllCnpC
SkQxZVF9JCRpQTRmMyo4ZnFeISpmZWYxQ2M5Yn5HbFIwPFJoNTZOSC1QKVQzWTtmd044Vity
O2NGKjJqXmxaYwp6UCh1Z1ZtRUopNC1sJFRpJiEtJHVzQDJsNG8mWUAoYDRoWWE+RS0xKW1s
d0VCKVk1WkIhKVdMbk18UzglME9mRTUKekBSdn0ydkAxQHRofkp+bF99bWI7K3w4SH5LbnA2
eDAtTyY/VFRtP0dnRiFHcG1kQXdQSUk8Vn17UmVqTjxIdGN1CnpBXmRXfTA3aVVMNSZsZ2g1
ek5oQFYweFUje0VWMnx5cjx7cUlabzRKeFhle1RTZzFseFhvYmthYU94S3hAZT85Ywp6WVdl
Km85Y08zfVoyQl9SZEo3UUZuJVIoRmxEejt3Xk42KTVNYE9hcWtzZjlPX3pxKlV3R0Jxdmo5
SEROUks1RmsKemhwKXEmPTI2bERTQFYhS2h8Pks0Pi1rWXVBVk9ZU2RASEV5eWs8bl5OeyhJ
TDIycj5UVT9ZelJNIThoP2dMXyZVCnpGd2woUWlqUnQ1T3ZVJUpmOFl6JFVMTGF5TjJ6PnlY
MzRNKWk/cEslOHteRXRDQTZsXjhnSHxOP3BKeHQ2MiE8UAp6dWdAPWJUZ3FjbFUlMzNpNmc/
b05XbW9XKnVyYmpLPXY1ZyFXLStje1JzM3BxMjl7fHQ7X0JtRktAZ0lvUmBaS1kKejVMdl44
VT4mUkU1ZXg4SG5ZMyN7UGE2UlFYKSg1e1Z6Zjxgdit0cDtwJlg4PzYqb3AzZiVUUno7RWo0
NWZPMGhDCnpNanhOIXh7e35JNkpgQnlyVTN9WXBWO00xSVVaQWdUTWw1ZkZrOHR9JnFpdk12
ZypaSm1vK0B+Q15nViZVZ20oTwp6JmUrSGJvUjZ6Pj1ZbndGUXk9Nl5YZSVPVGJ+Mil5WF8+
fVAybTctQ2hLQChvSWtSbiNwaVVDWG5LKTBgZ0xRKyUKekBEdEEhWk1lOEZkZ3JWJHl7IUEz
USYrYFpFZ3B8bCh+KExreCRWUT9VWCRCKEVTWU8rKWFleWw5KW1DVGAod1c8CnpjZD9MMGpV
KVpZOEQrKFlMUGRKPHJlXkEqQ1lvO0tgLXRfTGluMj4xIy1tMFBZVnV8WnpHPkx3MGhebE5f
fkR6Zgp6LTUjKkhgMz5ALWk7c0syN1hBKFA4PGFta3Y7UmJ0bHQxTkB1fiZKbEdpK197ZUp+
bCo1V1VZQWxZNDByO2gqM0kKeit4VDhXdDltfmx1UHZZJW83NFJNNXNLYHcyQ1hPPiYtVyVh
a1h+Rz4wJGdwRmhfbFMhaThpY2g0OGxkZSlzM2d8Cnomc0F6Xj1wIVorWTtQVz87YmJxUXBh
UTh7dzUle2VQMkghKT9RSEg8ejRydDNrY19FPUxgcXoxeF9ySkZeZ3g+YAp6dmhVbnklcH0k
cUlLTlQtZE5+TCtSdXxYNnVweFlpeXtVRGReJXs+Rlo4S2Z9Jj5udDNKKWpMdSZEfCFmKztp
el4Kek1pJW57akl0QkwmI20kOVklNFlweik8YkYyeTMzS25qVXoqbC1EWVAmWF8xN1hyb1JH
TFgoUWhzJXZFcDNOK3B6CnohYnF7SVQ9TUZLcE4kNUtkJkQoVmx+PkFDTTA7X01Yfmt0QD1t
SD5nND4lVjZNeHB7cylDPCpAcSs3ZFlkJV9Abwp6SmhIYndZVSU/Tz8xOHQ1ZnljeD51Zlkt
ZCRYKj5EVzZTayNPJXB+OWJPJklWNXBtVG5NNCFIIz9uT2h0KSliM0sKenxII25uZE48VWx2
WG56VGAhQEhZTTZAekA1Vit6ZlJMMj1OdER5X2hOWTlORDtrfV5JU1ZMSnNNb01EeCt4Jlc+
Cno0UF5Gb2AzWk9RWEsrbG45YTJ3eGVsPVBReT9BPFo0d1JDRm93TDBMNDQ8KGp3blUqSz1Z
VWBlWFBKWERWJVE7Mwp6bUVDY1MjQHZOc2pqdz9GWWcmNn5nb0M5cU4zJXdqYzA7IW5re3Z9
OWx9b3Uyak0xZCVgZC1LYj9JUHxtayZDfVkKelEjVykmOVdiTDwpSkxZJWc4Uzl2V0ZxUCVD
MiZJaDZIYm5YektIclRLQDhvU1AqZjdONypEPmJuUVBDbmZpczQ1Cnp2Tyh5JHMwUDUzTndr
QCszfWN9cVZodHVkQ291cT5LUzJsQDQreU92dCYrP25jRWlZU2QxfEZ4LWNiNE9YZk5faQp6
NEA7RGpJcjFGZHxIU1lkeTR7eG5kVTVwWTF4JUNBZyZZaVAqVnYlKHhTcCNaKjQ8RGtkQU5j
QmdHcVZLPSpSdnYKekE3XiNtRXJVVWJlbT5tPGImU2xJU2w/N1RwdTBYYUF7Tnc3M35aI3Zn
Qz1yRWp9bXxiTitRQEdnQ1kyd0o2WiU/CnpjXnRWLV5MSDc3JEhodEBOWDVJK0tuSkpzWE98
JGFeZEx4VEloOGdQcEJodVdUNSNOeE5lb1A+SG89aXE4JlFyMwp6cjAzQHRZRGEtUmolTlF6
M0IlUlk2PjZ4KTU1PStBRUI0XkRtLXBRNmo2eHIhWCZoPUYjUyg8JkF9UWNaN3sjd3sKencx
LXdjXzg2TUJNPzVDYEN4Q1RZJXRrViE7ZHgzeHpsTkBqX2s8UzJLX3R1UDVucHh6dGt4cGQr
WEgxdVpBNld0CnpXIUZaNiMrTjJpP0ZaUHhgOyMyR2Q2JnRFTyZPITZlbnhzPER3ZUUrR1J6
ZytuazdSMXQzRENfVD01UW9BYkJoTAp6THNTKjcmeGNIKVEjMVdacURIKHRuSmN2WjFMNUJS
WEZ5cnE8ND05ejklbnBmV0d7KEN3PiY2fDVGUWNVNTctMFIKejhTbl5gOENrQDQ8TygqVTkj
Zmo9MVRrRmxFQyQ5RmxLcDV7JC1zY3luKkdwPjsmYFE7d31TPEhQNEp2R2pVcF5MCnpWRkRm
Wmw8KyQqT0JlYGpOY01MbHhuKE5SdyZMa0w9bTFWVTNVXjFDaSV5e0JRN01TWG4wO3Vsam5g
OzU4SHdfdQp6RHV+VDVvRyhIPkMqJERtN3twRUdweGNJTDYtMjhRKmBlYm89eV9JcUNhOWxu
YVRUbkJsdDMoaCVycnlQQEZ3e3oKejxrR3lBbVV0ZWdVMyFeVWtlP1p+LVdBVWlHY3FCIVQw
MXZfP1JgPX4/bl5xXipNUjclVyg2JVdSKy1fUTB1O0BmCnp4UWAhVCZvS2YjJShPeEdofl5t
Kj9BVH19SU9DazhQcntCfWV4LSFZTUVoUCVGfiooZWBCMTQ7ZkMhbWp2IT4zcAp6OSg4N18z
T1pzO1NRRURnbGl+dnhVd202aihEWn1wI3gwUjBeS3FNfXYoTyN3a0JoNHROQi1Oez1UMili
ZiV6KDgKengjYC1OWlhpVD97Mm55JlRvTlg7ZlVCdlEzc1Z8QHtEQXBrVT1BRyMlVzZTV3lQ
T2J0eUF3OzAzX1Vuaj03Ry0qCno0PzQ5JURyRlZybUs5VnIpekF1ZXNIMis3cTtROVQ1JUAm
YzZJQXYyekZeQ2JOQTREKW9BYDgpTlR4ejlHc0skewp6KlY2WmFpcD1vWDQrNX1tT01CYz1P
KTA1flZ3fVVjazRpd0VqTitEKSEwSjBYWXdRJmBUKWBQNT9PO017R1VwPmQKei1eeSQ1bkNX
TyphfEttbkVUdHE9RFFXflMzJkFseD9gbSlaT3Z6S28yT2cpfjxPRyZZSUFCV1NqX3dtMzFt
U19oCnp3OyFrRiVsUWI0JSFTfS0mcFI2WUFhaV5RRHBuQzA+OH5MU1NaTUtkYFo1a3NEJVF8
KmBBYTQ1JD5+TyQmJnVPUgp6JnBSTGpiRkl7YHNkOzlJcjdlSGhSTmkhQnY+aDM5Syh4dkIw
dj1vVnFkbE84SHRsZiErMzZEdWVTITZ4SmEmSyQKemVgYDEmRW8tdi1JPUM9WWhqVEtyN3ZF
TUpIKVU3UTB4KXZQJE09VGxwPTR6fnpwfF93TXRYTFNfMyQ4QkM2e2R+CnpBXy1mdm58TlFD
O2xjZFMyI2s8VCZgVzhRJCtNU1pSJCl6c1ImVHl2TC1OJCs7NVEhc1pVJVp7VjEmVTBSZlJx
JQp6X2k7QVVkPmdjdDlxJXtWRjEoN0A0fChEXjRwOVE/R1Z5ZEhgVF57MEtBWWM8TW8/N2Ve
WmRIMDVAIU54RS1tYnIKeiRhfjFTOHZyKXchU1ZMITdGajM3bEtgVHt3OSM9WEs/eC18PVh2
TmA1ZjhOZTk7MDFtNDlDUkRRQTFkSDshSX4yCnp5LThySzE5RnVGRTUkcClBOVkrZSkoJUla
TjU+TFJOdEFiUmtsNGBCI08zRD9HWjA3YXE2SmNZVzBMIWlAeERSawp6Q3tvdHNLZmVgckV4
U3NBSTVxP0NqNVReQGg8Nn52Tz9zPjlpZ1Q8anQwRk45ZCU4MGk5TShmbXZiM2hGS2FmbTwK
elA/MHdRPSpiV0RQIWQwZi10ZFhmQmZSeDcySkBAY2RNSnJFV3dZYFZ0UmRATWpyVzJDajZj
MStBTzYhWUJkfVdaCnpPMEhYaiZ+dX0wSHNyeC0pTFV1bnsrKSg8ZkwqYFh4NCgjSktWdXRr
SSRKam1KeGlLQlQhZ243ckp8SlIpNihnSQp6NDZ6LVpzN3R5TD0pS1lvJDlaZU9XRXt5P0k7
a2w8dDd5UyZzazZFZm9lPElZT2Nnb0J0U1lvdWYoKzJvR01fS2IKem9uayY2ODI9ZS1wNmJU
QUE8cFU3YSZxUl80MWZCMTZfMWxrYjNVQCEhVz1kbW4yKmB7UmVHX0VwaEs3cGQpZjhJCno7
QGoxREZIdEhFXlFBJkVReCVLOUdgWjlFYGloPVU1OSRvK3FwJmUkQWViVy13YS1CTV9GM1l5
Uzl5KVpGSz5fTwp6akkjRG1aNnd+NEBZOGEwdSF5ViVjbDZJby0kb3IrSGU+ZThnKDJaN1FX
Y0hUJE99SndRdnYkYWRia0omeWRocWoKekt9e0gxV0BPYHJkczJQNENwbTlNS1d4aVdzQDF0
MGA9Mmg+IT1WZXhWYz5JKmMjMDkhSy1fenBOYTlMWEs0cXE+CnpmTihMVTk3ZiFjdE1pc1lO
NTJTXlNCRCYhVmA4VyYyQDJ4ZkNpem1sMSNSTFpqLVFLTXRAfSt+eC0yK2djbkFFPQp6aj1k
dTw0Ji1UdS0+U3h1YiNlUndDODM5WDFrQyU9cFohaHdzRnJYPFokWUZnb0NZQjlTYWh1aipU
K0trWCEjRmwKekFHfV5sYzlCQGE/WT9yRFBMQUQ+cWlONzU3PkZEKm16b2lxIXExZyh0UERv
RztVOFRpQk4tfWxkMk0xYWZNYFU0CnpCNUR8aVBEJkskPUlEdFc/QUN3YVcwQ1pnUigjQ2RC
JT82WjRUS31fJC14bDZSajUqP2k5cjtwWG1+dXcxbjN7LQp6PSojT14hfHUzLWNCPjBqeTsw
WHlkNGJsJUEwZ2FPX2wzbnJJT3UqdU1tJDlgPD5MYFIxLT88TXBaRSEyYlVJbWMKejlvI1Y1
clkmWT0wJj01WU8qTz9AZz1USkNFUzU2TlNCWV90ZT0odURNdnhwNjdiXnlqe1daRklwfkZk
PWBgJj5iCnpDfFBhemNybWYkT19IJH1PYCE3Oy1jeWU5MkgzJiNgczU9dHA3bCpQdVVAJFMw
YEhyalJlJn49Wk9sM3wydmVyNQp6XyNNSC0ld3dLayk+PXw7TDFnPX4oSDQ0MmJvMStqU2or
OWE3c0lPNURaeWdBTm40fmwwMSl6cD1TSCVDdDlXaUAKelhGR3ZLayMyNSVhU3pPZz95dHNe
JFlpWVVCe3VuPCpKZUlTNWxpPFdGT155P2QpNTt5Xj5GSHNvSTA8JFU1TUpuCnolM3EoRldz
ODE3aShINUJEdGc3c1JqYCVaRUBZT35reksofDU0VkJuMHJ1R1lLYEsqcUt1VVI0ZSlOMUI7
end6Qgp6O2hYe1ZJP01BKiM/OyhxJjhxIWsyYVlBVz1TbGR7b1ctbzBVdXt2bD5mJUVOV0Er
PzxzVFBoOE42fTBXJismdkMKemJVZT48JSU1JHtPKWt+VmFSX0VpJT1gR1NKKWcrMGstP1li
PnN6SmBiPmZKcHF0KVg0b2VUX290T1I0NkwrKjVkCnpTPGxKNXBFIWMrP3JQbSFoWGRGT0pt
KCNaUEQjdGlFaTVWZFFqRkNOUHB8Sj9JODJPUWJ+OSYjIz5kV0pHVjclWgp6VjxOTk1VK2xw
K3RWKnA7VEx+flNMOVV6Z1h0WmwpZVRLfjR1em1aa0UjcFZAQmV5NyM2WmNENDdLcEopVUBB
R2cKek0hRE5xRmNefWpSXi1uYGktajRsTzVMWS0zfGQ+eHp8N1hwJmMxYE9wJUNMVzRMYGdn
NGErdiFmcTN9IzxUfHA3Cno3UDhsUyQ2QUJZbEYhbXRNfHt2RjllaG88Ynk/RmdLbFdRdl87
ZyFoRilkdFhaI3tZVCliQEdxNmkjNkxyN2JnaAp6OzlKQHlSSERhNXdRI3soY0w3PkNoVXBS
XylvcFdJKFdYJkxoITx3Q0Q0Xz1MNzlJQWJnJSs1KzxLdT4jans8e3sKenF2IW0lS1JpUkdg
O0tVaHM3I04lVlNXcVA4QEUld3M2WlJQZkE0aV8+MFEqO0QpYTw/TX4xRHgrbCUmLVFPV0NT
CnomRmojNSl5V2pQP3w8IVJndHtneF9NU3h5KEQkRX07SGJZaEdOSnd1KCNnaSQwZDJTQWgr
RkBTbnREYWVNYkYyYQp6M2pKQENLPDh8LUFVbj01clZoP1ZGMkZkc2oqazRWQz9tem81b2tg
YG1QUn4/MUpOVTM5eklIdns4eUJ5OylXQWcKejFWIWhTKXRTXiZHRGBWaDUhfkEjMjFhTWhg
ZnNibC10RytjK2xnUU5KTnQqTCRZK2AyZXV2S05Na1Rva1N2MkU2Cno8XksreVdwcTdIaFpj
Nk5lbWNzOURraGZzb0RqeWAoWmcqdW8tMz0+d1p0TkB6am1qQEtrMT1jZz9sN2tAVW9GdQp6
anlGcnUhWDtPZEZBekhCaX1yeyVVLWc9SlJ8Yl89T345YVV4Q0EyJTloQSRfS0FUUUhsMjlQ
O2d4PDtMeHV6Zz0KejlsZENNaC1mMSk4JHlueD5FMGp3NnY8aWtuWHhsZ081JVRJYSkycVo0
VitCfTVaTTRAV2pwd1dacm1jWS00ck00CnpGI3Fhaj0lJUw1UT1TfVBOZGcwY0Y4dWZKX1RE
USY4Mmc7Y0V0NHQ5SngoaTkjYEZHXiRRQXcwPyFhe0c9XkxlYwp6dG9iT1Rqbn1ITVhBO2Fh
aXdnYm13alIzYlAqfGlXOGtuZikkMz9uUGF9aX4xLSo/cm1xTW8+UndLb018SlhxaF8KeiV8
UT1DRyUyajRmJXJiY3IrekdxJTg9e1hrKHRRWFghUCMqNThwNXMmMFRjX3g0akQ4SV8tfj89
QU9SbT8/XkNqCnolJH4lWVh1S1lNQEZTfjlpI3BEVGtQejxgdnhsJVU9WFlwQDw0PFJOc1o7
VF49dlZ9MT0lSm0yNT9CbGtJdk91UQp6PiY+MTltfj53YzwjO2tIPiZePnJOPU0/WFpoMyZ+
OTtOUENqWUMtKC1eO25STjxQOTZLQSo8SWtXN2BIKSQlNDEKemM+UjNtP05AS1MpeEwhcGdP
VF4/Y1hJTTJPQHxJK2Z8KWIlQEw2fWBHa3p9KzxAJXJwK0dBemQhXmZne1ZCISl8CnpeaklZ
PysmJEs2TFU8K3JieFZHNEQ5SkNtUURNNkUwe3NKeW9eVUVMdUw/N2VqT15LUjFJITA/cHc4
KjBNandUPAp6OXluKVBaMFIpQUI0eCYmQ0YyTTU/amBDQ093VEAzcUlGe2lrbGkjZT5BM2h0
NW17fWZgYz1kXnFxRCVBSWR8aWUKemV1UXwheCU/YCozZylPTzF0a35ERDdpa0hpWEpCPzk9
YHIrdmg8PE9SWVpUOEdqU2RpYyYlZytkTHVIKXJ9UzU7Cnp1aW1gUnVPVk9WYmdWbDE+YTIt
aGdqNU5PdkhxcHpYfittbXloVig8X317N194bnZ5KFBhTUo2WFljKjIzUGY7PAp6eFdHUGs5
RVYmPy1UZnxCPiZmQURNVH1ZUj42QGQhRVg3ZzJNTlR1cWZKfGZuVyk9KiZ2KmBYdWFgb2l6
K3t0PSEKejF7TzF9bXFMJmx0UztnTjhIP2NxSXpWNkY1akdmOzM3MEUlLX1WRylJTypKYmJi
PXZKNFl1LUY7JlY7RVM5OzZeCnpDZnxgSkZUPlF+NTI0azFHSCRMWXZFYDchJn1ZKE10Z01q
RUhVWUVzJCNWNlRQVC0lMk1LZkVoRzNCN0N0WX5sVAp6KDNqKGs/S31nbzxmQ01hdGc9UmRV
WSRedFhiRUVmSm1TLV83aEdYIzlRaEBiRVd+V3RvPGR3X1UyQmI1OVUoVjAKekI0MzhKc0Ni
NkJgbmNvYVN4UnpxPFpjeH4tP3hvQ3d+TmkoUjMtaSg4MjNPQUhfVGFhUiUxNWJkdFppZjhQ
K35JCno2Zm5Aa2VNJW09dkE4JkkrSVVxWGdSKkozdkgwc21YRH5nY2habE9ob1ZmRzJrVU5G
UTMrdEI+aj9RKnNhM19XRgp6anJASWoqI2kyOUBsXzhrezc5Xl5OZUA1dGAjRktJZ1d0dHMh
Y1YzQ2ByeE98QiUoRkgmMVlxWlJoOz54NEw9ZzIKelkzZVQ4PypWPj81SGdkYHpyciNndlR7
T3NeMTh2VW1KRllAd2BrJEg/KF9GTmcoT3kramFoIW8mWSt9aV5QeSVhCnpyUn5zI2RsU0E5
RFFqT30tOFJEPlJhcU9jdW4xbjYtRypaY2VsMV5BdTgkKyRYRl5KMzxgUV9qZ3lnUntkM0R+
TQp6YDVqUjtufFU1ViVOX0dRUHhkM214Kj5YMmw1ak5oSihFP2YoOUZDY2RVYW84cEAzd3tu
fGE+bzFWMD5hISFyZ2kKemo0Z1YyVmclMmI0ZipsKjghNV50bClYSCRWMkomOUBnSjhvbFkh
Wl8leTteOyllQFg4PTtxaURFZTI9bT1DdnsrCnprSWNISkZnYXxBQmt8fDh2N2g5VzV4OEJ+
KVUma2NjZi0+VzA4M01LXkJqY3cjfGd9KVVIeileIUU7dzA3M2Bzbgp6YEd8JnB6Kko8WEx+
e0NDX2BNJSQwOT1lcDJTM2FqP1I1YS1pSEdCSnRIXyljJm8rPGtWbnNKY2s7dWB1YT0kWSQK
emdITTtNWkA5dEsxYTstTE5rJC1FU2tUVSo7Q0NsMz52WWhyN3p2ckg/OER0WEdhTVk3PTFU
YWVAPmdSaC1FLUBtCno2Jit5T2JKY043dDEobE84cnR5KkxVZzA3QnpDejIkO09oRUxlRyMr
NFo8VzVmUWhMJjJtVUVDb0YoVEkrMEwzUwp6ISNVSyh1aipAVUVGZlIqd1A7M0ZhTHlJPyFW
cjxwVjd+YUpyWHJAYjx9YmxmPHU1fipkKXZEOztvTEI0bWZsPTUKeiUwWW0yNFVaTHB2cUlB
diRGKF54MyZ+Nis4TWhXV2M1WHRVazcrRXF3YjZlX3ptNGhZJE01Kit5dz45XktuZCQoCnox
S2tBejNiWXVLVUZVMFBscXhMOForbjlVQWZoSUkmeTMjSTZzZ155JjJMcGYrdD8yOFY2Rzxi
IVQjd1Rka3tKOQp6KSk0RE5zfllPVHMhbXRyZzhudHU+YDl7NnhjNWVTJVkrNigmKHdVM2R0
ZWFAXnV4cTI/UXtqYjhLTH5lPmJ7TzwKejN9QnN3NE9NYDklNEJXd3VycWY4Iz9nNlheT3Mk
MXloXl5oKVRDU3ZuYkhBa0tSUXlTbV5wcSQmQ3dtX3BgWElaCnolMEokaT53dlcreSRDSlBB
NEJYJmV2QEl1SFYmZVd6fVAhXndUbVMyVGJ4aUh3VzZtMT00bWl7THlQXihpSmZRVQp6WiZy
MGdaREJuWTlsUEBvMz9CZTx8SDFRO3d6bSk3ezZibU0hQzM9MzJtcmt4K0clfD87Mm1jNGFn
K2dBWkhVZUsKelFkSkt8V2N9SmokOVZGJXN7RSZDN1REdVNyRiZuSEBmbmg7bi0qWGpvWSY0
eiNCcXRPazZoLTQtWEhDZygjWVJNCnpOaSNXXkJ5SDx+ViQ/NWVlN3dQe2xMWlo8ZlNPQ3lx
Q19uRTs0WnR7YEwkbGl3PzU7Pil+V1gxS25iYUJjdXZeawp6U1h2YV9qdUxZelR0bl5XZHgz
VTdDOz5JPkhsTkdoNTNuU3k5Vzc+Wmd3K3ExX2JAalUwOUlZRHFCMDB5eXFSPisKelYhYTBe
ZXtwUUZTQkh0bm14LXc3YDVzMFlxVDJEcis3enk/RER9IWJgXmlYNGNUUiYmJG9JU21UejBq
aT9NSmpSCnpYMGdpQHFfa1VDTE1YWUkhMzwyNHZ8VFJ9JX5VXyE9Ryl6cDB6JSNHUlJmX0dl
JV55TTBMJDklMSFpbHg+WVMoQAp6UXllZ01wXlhGT2ZhbHk7bmN8NyUxRlA9NyVsfXF5Ujc9
JmotfD1wVVEjS1VjVUZrWCNzSHMjT29eIWZwTTs5UGsKelc8UCZ4IX4tekEyVGIoNnIrZmBz
Pmw2UDJOK1d2fitgV1VDMkUtbng2bk5mZyswbzdmJWIxd2srOGQmeCtkMiVwCnppRiQoUHVI
YG1ISTw3a0w/QW5SOHZyJCVkYFdycXdUb2dYTDJhOT1BVUhLQjYzcytafjg4T1F+MDE7Z3Ul
WWNsbwp6TjteS2luQDEtUXhkUCt0SGx8Jl5nc2ZObm9uX3N5IzJZWkNxQDY/Uno/MHlWJURU
KWFrSDlidm1gOEVSP1AzIT0KelgrbVk8P2tUO280c3NzaTcrbWsoPFNWKyZTWkJWMypjaj1w
YEwrdkBtaHozKTxoc2lXaVluWGZLaSh5QD5ZX2E/CnoyRmpVQSM1dTUlPSZnSG8jZzw1U2F9
M2V9LTdsdCYlJDl3Pi1vRVI7YntyaiVxY1lHMEZoLXxgaDA4SWIkRkVeYQp6IVE+WW1sc0Uk
fmwjdm0tLSZWTmVke19rLXM4YSkzdDYhOUFHWD9oWVJmdyYzaW14M1FncE1DMDlGdEp2aiRf
RlMKeih9QnFaZ1BpT0JqTTxXUlMhUzhrQyNzX0Q0KWVIeTgydk4wRF8rUEQkRXUzPTRmbnh2
MXUmUX0kZFRlKSRCaD97CnoxN19eX3JFeG0zZ0soYzJ1R19qeXFFcEhiPDRKdnNSWkM1WCkp
czV6IUBYcX51THYxX2hoeFpKK0hlI049RChaSwp6el5ubD87ITtpKFctfU83TWVISHcxUT91
SUg8JmleSzZ6U3YwK3swYEJsTFVgI1QpfEwhUnlEIThscCtHdlBLR1kKekRId2pPai1TdDN7
UD9XYE9pUXVPcDxHKUgpfXIkb05sOUxUR2pzfWlwKDEmTyVwbGYhdEx9WG9Hen1AfihJPylR
CnpFQVJeemAqcz1yUyU0bCYlc19DNDE2UEdUYEdVRGBfUlJ0P18qb0FuJHRmNSleYX1fcEF+
fVdaWkp2V3E9JUdaYgp6JDVLOFFAKWhLWkMwbSNLXnU9ZEFsO2VufUs1fjA+cnNrXzl0Nz8/
VjZlTytAPD1zODliO3FgU1ZOWXUod21KV3IKendlVXUxI0dhR2EtWSYtYiVDc1Jme0hKa1U+
PlRZfTJoS1gwe0VlP1ZZX0V3ViVmUFVmZXdUfnpKMWJNMDxaQj44Cnp6MyYtVHE5PH1DXmdo
UUBpdEM4PyFJVF94N0x1RDZCVWJ9cnFpRX5KZTY0WiZhWSZ9WXdDe289YWJOSFR4MlojJAp6
MjQtVkl7T3c/MWFMNSE0I0tiYGJkPEFLSEIqezckVDZMZHlKe04wRVpSSWlPaGQ5b1FSJHA8
NG5KPzdJRTFkPDwKekB2eD9Ed0xOdyl1QkIrPyomLVJ7WDkhdzRsbVZtanJEYD9yQH5ZS2sq
WUU+RSQwek1QT1UtJj4/dC1JNlpvUWN6CnpDM08/RWs+KzM8XjBgZmZETHcyOGJnUjB2QDZR
cCpQTUNHfVQ2fE4yOEJKbTRPM2JBLSklfE9IWlUoTEpTMlE1fgp6K3hhVVIyfXQlcmZJKWcj
P2l8I2Jkamthfll1aUxBU0JDKUNRZVhHfD1zamB2aE5FXnElQ0E7cENJI2JIZllGZ3sKekBU
OChvVWtyKmo5Y1NEdFYxSVB9ZF8tZSM4VHtkVUcpSDImcGhvbVd6UHBWeXZYZE4jZiFKbHJg
T2t8R2piNmNxCnpxVkxmezYwZ3FKVGdCMV5yRHc7Nj0yVCFGaDtaMUN4eEtnRmI2YHZIV3Bo
UGtuPnMwWDlBN2tTJjR1VUVLdCFMeAp6Oz07UmEoNVh4SCYpdD5HLUZmaWhofGtMcjlvWT8+
Y0RGJWE+UD0rUVpFRz47VkNlfkExdTlzOUpEZmI1Z0RMZzYKeipHLVdZKzRZOCVFWTxnaFpn
Zlg3XkQlb0tlIzl0d0NGKUp9SDVPZDwqMCN8KzF4ZnZFJUdEelEkIShaPGBpNFo2Cnp0aV5t
eUU+PFVYNGcwRUFoaitxNmkmfFkxSEl4TyVNfCE/ZmtYIX5VdzRIdTdYRlo7bys3c09ZeCpS
SDNvcEIqaQp6VUc/Um1TZU8rZyhRe0A5Y0tFP0dYfSQ3aUptKEZZT3RFJWgkbVokUkZmRk5a
aEIqdCYrK3NjRjk1V1EwKn0lWmkKemhsUUspOT5faD1oaj18RUY3fDl3NmxXVGcrJUFnS1hx
cCkhTUstK19odmpYPEhMZzg5KUl2eiYwZlZWWV40QGZoCnpCX0dEPSlLOFI1WHpZRlJsTkB0
TitZelVIZXxRKlFjX0V6Z1QoTms0eD9HUk5CPjRvdmtXRW8oU1BRa0Fgfns9cgp6YiFeemE5
Z3pqPGtOSiZ5YSljeWJWOXs7dEArPGpBaD9PbXVAcVl1KyZSens5YDgkZGhuOWRIKkJZJng3
c0tQJiYKekFwY1lHKSM+ZiVkbEd0KV9yOWted01zYVFAcmQkJF8lQV4jZjtMYHdVWiozIWlM
djhxR3FDUDY9VThtdlFNQDUhCnpGQWZJYD9yM0lpPk0mcVIkZ2Z7QCVvamJvbCt9RiMmdTc2
Z1RwXlYtK0x5MHlxQTNBfTxha2VYekY2NHFvKj5iXgp6UWRWNnJTMGFZVitpcnJpej4yJXw4
O3FlRFZ1YjZtK3dFZnZpVFckSStUbEdne24qfDNDKG1PfSZjQG0+bzhXOWsKekozVHtNTC1g
ZjdGME1oM1JsczI7YG8rZFIwPGhYRl49YEF6TkdVQUZMdD1Ub29fdmNJJUElMntieTdReV9w
cS0jCnohVzhWYzdWKSpqPD41YTd2LXdsSWxTU3kjbWFeY0xxdkY1OFJ8ZzdVKnhqfmc3XiZF
KC1VNVJhe01ZflJ6OTRSJgp6R2JBKTxrJW5MNlg7UFBIfEJrRW00aWxPfjAxSHpJNE0qeDYw
LUd6bHdSV0QrcGIxPSlPS0E5OS1DVlJlWkY2O20Kej5Id2RLQlVGKy1TVVh0cUooYS15Q0o/
R3FxKUx7VERLNyo4LT5tPk9FYGdgSD9nRE95YyQkWThNczA3ViFKQ3ckCno3e2V+N2lqV2lj
ZEAyaDhOPlVAVSVhK3RYWGpoMyk4Qll0I3UyTGVFUDt2P0B0MSVXZCFydjxOTm54NGg/Xm5u
PQp6O1E4ZDdlTzh9SXsxJUo3WCszfSphI3UjR3d1UlkyUiR2KmA7dD84PTZEaFhveGdvWDs7
KXIoYSNoYzRGdlA/IVMKend4T34qZVROOUY9NiFBNmNja2ErPTNPaDBzUz5iWHU/MklqUDYy
bC1pRzRMeGVjYVFKMGBRWSlZaGMkS0Fob1R9Cnpqej9KKXM4NmcpYSUkPXZWQ01vOHUlSVhZ
dHROO3BgfXhoQTghJSZ4ODtlaGo8RDgkTEhfZGU7bz0ob0hge1llYAp6enUqa2U9a181IXcq
X0B0KCtgRzZPbGdYPFVsZGJJcSgobmA0JW19cCNkSG1DcUEpMUR2TTR3LXdNWjZee1ZLX3MK
dW5mNDJTblpJeWpCSSFxTVhSMUB1T1A/WmRTPytWTlBYO0NfYEU0b2JgQGpGK2cjU2U9Sz5h
X1JJLWpscAoKbGl0ZXJhbCAwCkhjbVY/ZDAwMDAxCgotLSAKMi4yNS4xCgo=

--------------3f5xutyYOHSvHCnpfyWF1wEm
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--------------3f5xutyYOHSvHCnpfyWF1wEm--
