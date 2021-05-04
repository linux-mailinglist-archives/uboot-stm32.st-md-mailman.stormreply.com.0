Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4955372A4E
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 May 2021 14:46:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 835F9C59783;
	Tue,  4 May 2021 12:46:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0805C59781
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 May 2021 12:46:28 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 144CgfwL008240; Tue, 4 May 2021 14:45:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=LIm7+XDT8e0kjWsbG6bCoAeDJnkuQ6XaJqwQeQopcb0=;
 b=X/oUW4v4RYy8FCNP20c54sagpgqBRI/ewseoogFwPV8b4rnU0+XGusGFrWpw/vipmMHi
 r7cu1iMB2qcKoeaLZa89zotS/umjOrVWNxIRpDNKxsMp5U4b8frpAmqcgGWKrNXwGg+u
 X0+HwvKqN6Y3YIWodPY4rcef7kZz26EBQrbehnK9Js+EO8e2DbBF9rGYkpsPlDKrCnX9
 P5ZtLmJwRswR89sOZMhxyckRW/KNNfQzhbSjzeH1vdGPGoryuyOmxK7Obgs0bKXkdb36
 FRNIlGMwvWLNPLNMEUiQ6V87MJwLTmiFuCEZdUCfKKtNrIoLqqbeVNB7avepViCaIr7Z rQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38b4yw0fu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 14:45:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A9A8F10002A;
 Tue,  4 May 2021 14:45:51 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9683C226578;
 Tue,  4 May 2021 14:45:51 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 4 May
 2021 14:45:50 +0200
To: Simon Glass <sjg@chromium.org>
References: <20210428102345.3192-1-patrick.delaunay@foss.st.com>
 <20210428122109.v3.5.Id906966934e591cb691481197488ae2cfa31ffa1@changeid>
 <CAPnjgZ2KvAKjxK=2N36G5TM3L1GuF1aK0Ftj=jgjjg=Y+WWYFw@mail.gmail.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <8c51c0e1-4e42-b75d-c0e6-239837a0388c@foss.st.com>
Date: Tue, 4 May 2021 14:45:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPnjgZ2KvAKjxK=2N36G5TM3L1GuF1aK0Ftj=jgjjg=Y+WWYFw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-04_07:2021-05-04,
 2021-05-04 signatures=0
Cc: Marek Vasut <marex@denx.de>, chenshuo <chenshuo@eswin.com>,
 =?UTF-8?Q?Fr=c3=a9d=c3=a9ric_Danis?= <frederic.danis@collabora.com>,
 Ard Biesheuvel <ardb@kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>,
 Wasim Khan <wasim.khan@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Bykowski <marek.bykowski@gmail.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v3 5/7] image-fdt: save no-map parameter
	of reserve-memory
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

SGkgU2ltb24sCgpPbiA0LzI5LzIxIDY6MTAgUE0sIFNpbW9uIEdsYXNzIHdyb3RlOgo+IEhpIFBh
dHJpY2ssCj4KPiBPbiBXZWQsIDI4IEFwciAyMDIxIGF0IDAzOjIzLCBQYXRyaWNrIERlbGF1bmF5
Cj4gPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+IHdyb3RlOgo+PiBTYXZlIHRoZSBuby1t
YXAgaW5mb3JtYXRpb24gcHJlc2VudCBpbiAncmVzZXJ2ZWQtbWVtb3J5JyBub2RlIHRvIGFsbG93
Cj4+IGNvcnJlY3QgaGFuZGxpbmcgd2hlbiB0aGUgTU1VIGlzIGNvbmZpZ3VyZWQgaW4gYm9hcmQg
dG8gYXZvaWQKPj4gc3BlY3VsYXRpdmUgYWNjZXNzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRy
aWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+PiAtLS0KPj4KPj4g
KG5vIGNoYW5nZXMgc2luY2UgdjEpCj4+Cj4+ICAgY29tbW9uL2ltYWdlLWZkdC5jIHwgMjMgKysr
KysrKysrKysrKysrLS0tLS0tLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygr
KSwgOCBkZWxldGlvbnMoLSkKPiBXaGVyZSBpcyBuby1tYXAgZG9jdW1lbnRlZD8KCgpJbiBsaW51
eDogCkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZXNlcnZlZC1tZW1vcnkvcmVz
ZXJ2ZWQtbWVtb3J5LnR4dAoKaW4gVS1Cb290OiBkb2MvZGV2aWNlLXRyZWUtYmluZGluZ3MvcmVz
ZXJ2ZWQtbWVtb3J5L3Jlc2VydmVkLW1lbW9yeS50eHQ6NTUKCm5vLW1hcCAob3B0aW9uYWwpIC0g
ZW1wdHkgcHJvcGVydHkKIMKgwqDCoCAtIEluZGljYXRlcyB0aGUgb3BlcmF0aW5nIHN5c3RlbSBt
dXN0IG5vdCBjcmVhdGUgYSB2aXJ0dWFsIG1hcHBpbmcKIMKgwqDCoMKgwqAgb2YgdGhlIHJlZ2lv
biBhcyBwYXJ0IG9mIGl0cyBzdGFuZGFyZCBtYXBwaW5nIG9mIHN5c3RlbSBtZW1vcnksCiDCoMKg
wqDCoMKgIG5vciBwZXJtaXQgc3BlY3VsYXRpdmUgYWNjZXNzIHRvIGl0IHVuZGVyIGFueSBjaXJj
dW1zdGFuY2VzIG90aGVyCiDCoMKgwqDCoMKgIHRoYW4gdW5kZXIgdGhlIGNvbnRyb2wgb2YgdGhl
IGRldmljZSBkcml2ZXIgdXNpbmcgdGhlIHJlZ2lvbi4KCgpCdXQgSSB3aWxsIGFkZCB0aGlzIGlu
ZGljYXRpb24gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgoKCj4KPiBSZXZpZXdlZC1ieTogU2ltb24g
R2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+CgoKVGhhbmtzLAoKUGF0cmljawoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBs
aXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
