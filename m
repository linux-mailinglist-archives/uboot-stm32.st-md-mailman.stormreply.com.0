Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1543D0045
	for <lists+uboot-stm32@lfdr.de>; Tue, 20 Jul 2021 19:31:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A7E7C597BD;
	Tue, 20 Jul 2021 17:31:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59758C597B8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jul 2021 17:31:24 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16KHQvvg028997; Tue, 20 Jul 2021 19:31:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=zzuBGlk0+tyoXLgG7/QZHxcw6gprQ8xHUWHO8a+r8Hw=;
 b=NNUj7pY5N5KAJNPvB8Bf7erHcG3DijLXPL4CYdT+eY0eAGD4nrGjRCBa9MAE15vvnL9z
 x2zif19AVq+DYV1KqIE0UWQcmcYyGPSL5Vdug8j1VwrBiO+BJUkunSF4Bet7IcCQecps
 N/YcEnYRYCAGkKQJh/X1mzyRS45VYPkZU+9Os/UcVeANq+SBKixhyI9YCcZLfLiHWTi9
 IONAEwuJijysyDpLH8q7v57tMhkobvIONmbEubU0hDSWmKkLR4cJ40QSAyfHNVsZ/WM+
 IQILZwKwjCWsb5376AJmnJKT2ljFrBIs/GHdKROPCYNVqh1SUKRZ0yG4JIqKUDFLKAEI sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39wu03twps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 19:31:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8D67E10002A;
 Tue, 20 Jul 2021 19:31:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7B7F42C38BB;
 Tue, 20 Jul 2021 19:31:13 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 20 Jul
 2021 19:31:12 +0200
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, <u-boot@lists.denx.de>
References: <20210715152207.46118-1-patrick.delaunay@foss.st.com>
 <20210715172115.v2.2.Ib0b251fb6120b1654e40dba8cb37ac128648318e@changeid>
 <8e4ca876-a0e2-f1fc-7398-524bcb8474f7@pengutronix.de>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <229f82e2-1b1f-275d-f555-f6b35da00817@foss.st.com>
Date: Tue, 20 Jul 2021 19:31:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8e4ca876-a0e2-f1fc-7398-524bcb8474f7@pengutronix.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-20_12:2021-07-19,
 2021-07-20 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2 2/5] arm: stm32mp: handle the OP-TEE
 nodes in DT with FIP support
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

SGkgQWhtYWQKCk9uIDcvMTUvMjEgNzoxMSBQTSwgQWhtYWQgRmF0b3VtIHdyb3RlOgo+IEhlbGxv
IFBhdHJpY2ssCj4KPiBPbiAxNS4wNy4yMSAxNzoyMiwgUGF0cmljayBEZWxhdW5heSB3cm90ZToK
Pj4gV2l0aCBGSVAgc3VwcG9ydCBpbiBURi1BICh3aGVuIENPTkZJR19TVE0zMk1QMTV4X1NUTTMy
SU1BR0UKPj4gaXMgbm90IGFjdGl2YXRlZCksIHRoZSBEVCBub2RlcyBuZWVkZWQgYnkgT1AtVEVF
IGFyZSBhZGRlZCBieSBPUC1URUUKPj4gZmlybXdhcmUgaW4gVS1Cb290IGRldmljZSB0cmVlLCBw
cmVzZW50IGluIEZJUC4KPiBXaGF0IGFib3V0IHRoZSBTQ01JIG5vZGVzLiBXaG8gd2lsbCBmaXgg
dXAgdGhvc2U/CgoKSW4gZG93bnN0cmVhbSwgd2UgZG9uJ3QgaGF2ZSBpc3N1ZSwgYXMgb25seSBT
Q01JIGNsb2NrIGFyZSBzdXBwb3J0ZWQgCndpdGggVEYtQSAod2l0aCBvciB3aWh0b3V0IE9QLVRF
RSkuCgpJbiBsYXRlc3QgZGVsaXZlcnkgPSBPcGVuU1RMaW51eCBWMy4wLCB3ZSBtb2RpZmVkIHRo
ZSBTVE0zMk1QMTUgZGV2aWNlIAp0cmVlIG9mIFUtQm9vdAoKYW5kIExpbnV4IGtlcm5lbCB0byB1
c2UgdGhlc2UgU0NNSSBjbG9ja3MgYnkgZGVmYXVsdC4KCldlIGtlZXAgdGhlIGJhY2t3YXJkIGNv
bXBhdGliaWxpdHkgb25seSBpbiBVLUJvb3QgdGhlIGJhc2ljIGJvb3QgKD1ib290IAp3aXRoIFNQ
TCBhbmQgd2lob3V0IFRGLUEpLgoKRm9yIFNUTWljcm9lbGVjdHJvbmljcyBkZWxpdmVyeSB0aGUg
U0NNSSBzdXBwb3J0IGRvbid0IG5lZWQgdG8gYmUgCmR5bmFtaWNhbGx5IGhhbmRsZSBhcyBpdCBp
cyBub3cgbWFuZGF0b3J5LAoKaXQgaXMgbm90IGxpbmtlZCB0byB0aGUgRklQIHN1cHBvcnQgb3Ig
dG8gdGhlIHByZXNlbmNlIG9mIE9QLVRFRSwKCmJ1dCBpcyBpdCBsaW5rZWQgdG8gcG93ZXIgbWFu
YWdlbWVudCBzdXBwb3J0LgoKClRvZGF5IHdlIGhhdmUgaXNzdWUgb25seSBmb3IgdXBzdHJlYW06
IHdlIG5lZWQgdG8gY29udGludWUgdG8gc3VwcG9ydCBEVCAKd2l0aG91dCBTQ01JIGNsb2Nrcy4K
CmFuZCB3ZSBkb24ndCBoYXZlIGEgY2xlYXIgc29sdXRpb24uLi4gc28gU0NNSSBjbG9ja3Mgc3Vw
cG9ydCBpcyBub3QgeWV0IAp1cHN0cmVhbWVkIGluIERUIHNpZGUKCihidXQgdXBzdHJlYW1lZCBp
biBkcml2ZXJzKS4KCgpJIGhhdmUgYSBwcm90b3R5cGUgdG8gYWxsb3cgb3ZlcmxheSBhdCBVLUJv
b3QgbGV2ZWwgYXMgcHJvcG9zZWQgYnkgTWFyZWs6CgpURi1BIEJMMiBmb3VuZCBpbiB0aGUgRklQ
IGEgVS1ib290IGdlbmVyaWMgZGV2aWNlIHRyZWUgYW5kIGEgU0NNSSBvdmVybGF5Cgo9PiBVLUJv
b3QgYXBwbHkgdGhpcyBvdmVybGF5IGF0IGJvb3QgYmVmb3JlIHRvIHBhcnNlIGl0cyBEVC4KCgpJ
dCBpcyB3b3JraW5nIGJ1dCB0aGUgYm9vdCB0aW1lIGlzIGltcGFjdGVkICg1IHNlY29uZHMgd2l0
aG91dCBkYXRhIApjYWNoZSBtYW5hZ2VtZW50Cgp1cGRhdGUgYW5kIHN0aWxsIDI3MCBtcyB3aXRo
IGRpcnR5IGEgZGlydHkgcGF0Y2ggdG8gYWN0aXZhdGUgZGF0YSBjYWNoZSAKYmVmb3JlIGFwcGx5
IG92ZXJsYXkpCgoKQnV0IDI3MCBtcyBmb3IgVS1Cb290J3MgRFQgb3ZlcmxheSArwqAgMjcwbXMg
Zm9yIGtlcm5lbCdzIERUIG92ZXJsYXkgaXMgCm5vdCBhY2NlcHRhYmxlCgphbmQgU0NNSSB1cHN0
cmVhbSBpcyBzdXNwZW5kZWQgZm9yIFNUTTMyTVAxNXguCgoKPgo+PiBUaGVzZSBub2RlcyBhcmUg
b25seSByZXF1aXJlZCBpbiB0cnVzdGVkIGJvb3QsIHdoZW4gVEYtQSBsb2FkIHRoZSBmaWxlCj4+
IHUtYm9vdC5zdG0zMiwgaW5jbHVkaW5nIHRoZSBVLUJvb3QgZGV2aWNlIHRyZWUgd2l0aCBTVE0z
MklNQUdFIGhlYWRlciwKPj4gaW4gdGhpcyBjYXNlIE9QLVRFRSBjYW4ndCB1cGRhdGUgdGhlIFUt
Qm9vdCBkZXZpY2UgdHJlZS4KPiBbc25pcF0KPgo+IENoZWVycywKPiBBaG1hZAo+Cj4KClJlZ2Fy
ZHMKClBhdHJpY2sKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL3Vib290LXN0bTMyCg==
