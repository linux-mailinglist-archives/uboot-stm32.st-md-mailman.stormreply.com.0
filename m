Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFA93CA00D
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Jul 2021 15:50:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E38D2C58D7F;
	Thu, 15 Jul 2021 13:50:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2AFD3C57B6B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 13:50:15 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16FDg3Lj024493; Thu, 15 Jul 2021 15:50:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=H0mwL89MqQ35XlyjeCy+JpPWsnhG1lrhtGC5To3HSBc=;
 b=WA121BvwjIaMVqHJKll3wpc8Z0GlxpX6GdevvxKvj6zn7B9rdn2Op4xTwn8kPqlu24i0
 l57G0Tx/mPRwnZ9aNkGSEjIPo/tpBm2WpuFnAsQjVAWvCof9k4AF3Cd+R5gQL3Rxtn8I
 COIu7BG6u0SUs5KiaImEM8vW19NR9P1sl0EdHsDDjTNHeJJJEZW5eJNGCzGaTYbtUvDp
 fv1tq0HNvQRCILuJbAJisNHJep6oCvug7kETHJIlWvoBRXHzCPP8L/GEs2qaZFjK5yG4
 9jEh1dQgORn7z9bpD0ZxxVundHqMBBS8cgB/5V5KATAsBpBKrtjicCbu57d/aEuIs+SU 0g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39thrssr0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Jul 2021 15:50:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 20FC410002A;
 Thu, 15 Jul 2021 15:50:06 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 12D2922A6F6;
 Thu, 15 Jul 2021 15:50:06 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 15 Jul
 2021 15:50:05 +0200
To: Simon Glass <sjg@chromium.org>
References: <20210708091747.317500-1-patrick.delaunay@foss.st.com>
 <CAPnjgZ3XX_Z9kyFcerS9_GvjzkKzHmdfWOjAtC16k7NN=ReR_g@mail.gmail.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <8a64c1ae-5225-0193-3242-c40b86bc1606@foss.st.com>
Date: Thu, 15 Jul 2021 15:50:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPnjgZ3XX_Z9kyFcerS9_GvjzkKzHmdfWOjAtC16k7NN=ReR_g@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-15_07:2021-07-14,
 2021-07-15 signatures=0
Cc: Tom Rini <trini@konsulko.com>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 0/5] stm32mp1: handle TF-A boot with FIP
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGkgU2ltb24KCk9uIDcvMTEvMjEgMjowMSBBTSwgU2ltb24gR2xhc3Mgd3JvdGU6Cj4gSGkgUGF0
cmljaywKPgo+IE9uIFRodSwgOCBKdWwgMjAyMSBhdCAwMzoxNywgUGF0cmljayBEZWxhdW5heQo+
IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPiB3cm90ZToKPj4KPj4gSW4gbmV4dCBURi1B
IHZlcnNpb24gdGhlIHN0bTMybXAxIHBsYXRmb3JtIHdpbGwgc3VwcG9ydCB0aGUgRmlybXdhcmUK
Pj4gSW1hZ2UgUGFja2FnZSAoRklQKSBbMV0sIGEgY29udGFpbmVyIGZpbGxlZCB3aXRoOgo+PiAt
IHRoZSBVLUJvb3QgYmluYXJ5ID0gdS1ib290LW5vZHRiLmJpbgo+PiAtIHRoZSBVLUJvb3QgZGV2
aWNlIHRyZWUgPSB1LWJvb3QuZHRiCj4+IC0gdGhlIFNlY3VyZSBPUyAoT1AtVEVFKSBvciB0aGUg
c2VjdXJlIG1vbml0b3IgKFNQX01JTikKPiBUaGF0IHNvdW5kcyBsaWtlIGEgam9iIGZvciBGSVQ/
CgoKWWVzIGl0IGlzIHRoZSBzYW1lIHB1cnBvc2UgYnV0IGF0IFRGLUEgQkwyIGxldmVsLCBzbyBi
ZWZvcmUgVS1Cb290IApleGVjdXRpb24uCgoKSW4gdGhlIFNUTTMyTVAgYm9vdCBjaGFpbiB3aXRo
IFRGLUEsIHdlIGhhdmU6CgoxLyBSb20gY29kZSBsb2FkIFRGLUEgQkwyIGluIGVtYmVkZGVkIFJB
TQoKIMKgwqDCoMKgwqAgPT4gaXQgcnVubmluZyBpbiBzZWN1cmUgd29ybGQsIGluaXRpYWxpemlu
ZyB0aGUgRERSCgoyLyBURi1BIEJMMiBsb2FkIHRoZSBuZXh0IFNXIGNvbXBvbmVudCBmcm9tIEZJ
UCBjb250YWluZXJzIGluIEREUgoKIMKgwqDCoCBhKSBzZWN1cmUgd29ybGQsIE9QLVRFRSBmb3Ig
ZXhhbXBsZSwgaW5jbHVkaW5nIGtleSBpbmZyYXN0cnVjdHVyZS4KCiDCoMKgwqAgYikgbm9ybWFs
IHdvcmxkID0gT1MgbG9hZGVyIDogVS1Cb290ICsgZGV2aWNlIHRyZWUKCgpCdXQgU1BMIGlzIG5v
dCB1c2VkLi4uLgoKClRGLUEgQkwyIGNhbiBiZSBzZWUgYXMgU1BMIGEgcmVtcGxhY2FudCBhbmQK
CmEgRklQIGxvYWRlZCBieSBURi1BIEJMMiBpcyBlcXVpdmFsZW50IHRvIEZJVCBsb2FkZWQgYnkg
U1BMLAoKaXQgdGhlIGNvbnRhaW5lciBzdXBwb3J0ZWQgYnkgdHJ1c3RlZCBmaXJtd2FyZQoKCkJ1
dCBldmVuIGluIHRoaXMgdXNlIGNhc2UgRklUIGNhbiBiZSB1c2UgdG8gbG9hZCBrZXJuZWwgYnkg
VS1Cb290Li4uCgoKSXQgd2FzIGEgbG9uZyBkZWJhdGUgb24gdGhlIHByZWZlcnJlZCBmaXJzdCBz
dGFnZSBib290bG9hZGVyCgpmb3IgU1RNaWNyb2VsZWN0cm9uaWNzIEFSTXY3IHBsYXRmb3JtLCBi
ZXR3ZWVuIFRGLUEgQkwyIGFuZCBTUEwgLgoKClRvZGF5IHRoZSBwcmVmZXJyZWQgc29sdXRpb24g
aXMgVEYtQSBCTDIgd2l0aCBGSVAsIGZvciBzZWN1cmUgYm9vdAoKc3VwcG9ydCBhbmQgbG9uZyB0
ZXJtIGludGVncmF0aW9uIHdpdGjCoCBPUC1URUUsIGV2ZW4gaXMgd2UgbG9zdAoKdGhlIGZhbGNv
biBtb2RlLgoKCj4KPiBSZWdhcmRzLAo+IFNpbW9uCgoKUmVnYXJkcwoKUGF0cmljawoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFp
bGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3Rt
MzIK
